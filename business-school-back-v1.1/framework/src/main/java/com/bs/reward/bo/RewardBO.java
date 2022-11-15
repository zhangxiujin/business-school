package com.bs.reward.bo;

import com.bs.common.annotation.MyAnnotation;
import com.bs.reward.po.Reward;
import com.bs.user.po.User;
import lombok.Data;

import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.List;

@Data
@MyAnnotation
public class RewardBO {
    private Integer answerCount;
    private Reward reward;
    private User user;

    public static void main(String[] args) {
        Annotation[] declaredAnnotations = RewardBO.class.getDeclaredAnnotations();
        for (Annotation declaredAnnotation : declaredAnnotations) {
            System.out.println(declaredAnnotation.annotationType().toString());
        }
    }

}
