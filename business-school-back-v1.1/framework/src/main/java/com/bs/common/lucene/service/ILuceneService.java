package com.bs.common.lucene.service;

import com.bs.common.lucene.dao.LuceneDao;
import com.bs.reward.mapper.RewardMapper;
import com.bs.reward.po.Reward;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.search.highlight.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ILuceneService {

    @Autowired
    private LuceneDao luceneDao;
    @Autowired
    private RewardMapper rewardMapper;
    @Autowired
    private Analyzer analyzer;
    @Autowired
    private SearcherManager searcherManager;

    /**
     * 创建索引
     * @throws IOException
     */
    public void creatIndex() throws IOException {
        // 从数据库中获取你要查询的内容，这里根据你自己的数据库方案来
        List<Reward> rewards = rewardMapper.selectAll();
        // 将数据建立索引
        luceneDao.createBlogIndex(rewards);
    }

    // 模糊匹配,匹配词
//    String keyStr = queryParam.get("searchKeyStr");
    public List<Reward> searchBlog(String keyStr)
            throws IOException, ParseException, InvalidTokenOffsetsException {
        searcherManager.maybeRefresh();
        IndexSearcher indexSearcher = searcherManager.acquire();
        BooleanQuery.Builder builder = new BooleanQuery.Builder();
        QueryParser queryParser;
        Query query = null;
//        String keyStr = "配置";
        if (keyStr != null) {
            // 输入空格,不进行模糊查询
            if (!"".equals(keyStr.replaceAll(" ", ""))) {
                queryParser = new QueryParser("title", analyzer);
                query = queryParser.parse(keyStr);
                builder.add(query, BooleanClause.Occur.MUST);
            }
        }
        Sort sort = new Sort();
        sort.setSort(new SortField("sort_id", SortField.Type.LONG, false));
        TopDocs topDocs = indexSearcher.search(builder.build(), 1000, sort);
//        pageInfo.setTotal(topDocs.totalHits);
        ScoreDoc[] hits = topDocs.scoreDocs;
        Highlighter highlighter = new Highlighter(
                new SimpleHTMLFormatter("<B style=\"color: red\">", "</B>"),   //高亮格式，用<B>标签包裹
                new QueryScorer(query));
        //设置高亮后的段落范围在100字内
        Fragmenter fragmenter = new SimpleFragmenter(100);
        highlighter.setTextFragmenter(fragmenter);
        List<Reward> blogList = new ArrayList<>();
        for (ScoreDoc hit : hits) {
            Document doc = indexSearcher.doc(hit.doc);
            String title = highlighter.getBestFragment(
                    analyzer, "title", doc.get("title"));
//            System.out.println(doc.toString());
            Reward reward = new Reward();
            reward.setId(Long.valueOf(doc.get("id")));
            reward.setTitle(title);
            blogList.add(reward);
        }
        return blogList;
    }
}
