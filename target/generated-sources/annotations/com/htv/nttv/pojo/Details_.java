package com.htv.nttv.pojo;

import com.htv.nttv.pojo.UserDetails;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-08-31T22:02:50")
@StaticMetamodel(Details.class)
public class Details_ { 

    public static volatile SingularAttribute<Details, Long> income;
    public static volatile SingularAttribute<Details, Date> dateTime;
    public static volatile SingularAttribute<Details, String> description;
    public static volatile CollectionAttribute<Details, UserDetails> userDetailsCollection;
    public static volatile SingularAttribute<Details, Integer> id;
    public static volatile SingularAttribute<Details, Long> expense;

}