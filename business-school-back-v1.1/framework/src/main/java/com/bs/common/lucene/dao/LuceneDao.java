package com.bs.common.lucene.dao;

import com.bs.reward.po.Reward;
import org.apache.lucene.document.*;
import org.apache.lucene.index.IndexWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class LuceneDao {
    @Autowired
    private IndexWriter indexWriter;

    public void createBlogIndex(List<Reward> blogList) throws IOException {
        List<Document> docs = new ArrayList<Document>();
        // 循环将取回的实体类集合里的每一项插入Document
        for (Reward p : blogList) {
            Document doc = new Document();
            Long id = p.getId();
            doc.add(new StoredField("id", id));
            doc.add(new NumericDocValuesField("sort_id", id));
            doc.add(new TextField("title", p.getTitle(), Field.Store.YES));
//            System.out.println(doc.toString());
            // 存储到索引库
            docs.add(doc);
        }
        // 将Document写入索引文件
        indexWriter.addDocuments(docs);
        indexWriter.commit();
    }
}
