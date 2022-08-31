/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.htv.nttv.respository.impl;

import com.htv.nttv.pojo.User;
import com.htv.nttv.respository.UserRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author DELL
 */
@Repository
@PropertySource("classpath:databases.properties")
@Transactional
@EnableTransactionManagement
public class UserRepositoryImpl implements UserRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private BCryptPasswordEncoder PasswordEncoder;
//    @Autowired
//    private Environment env;
//    
    
    @Override
    public boolean addUser(User u) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try {
            
            session.save(u);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

//    @Override
//    public boolean findByUser(String email, String password) {
//        Session session = this.sessionFactory.getObject().getCurrentSession();
////        Session session = this.sessionFactory.getObject().openSession();
//	boolean userFound = false;
//        CriteriaBuilder b = session.getCriteriaBuilder();
//        CriteriaQuery<User> q = b.createQuery(User.class);
//        Root root = q.from(User.class);
//        q.select(root);
//        
//        q.where(b.equal(root.get("email"), email));
//                
//        
//        Query query = session.createQuery(q);
//        
//        List list = query.getResultList();
//
//        if ((list != null) && (list.size() > 0)) {
//            User u = new User();
//            u = (User) list.get(0);
//            if(PasswordEncoder.matches(u.getPassword(),password))
//            {
//                
//                userFound = true;
//            }
//                
//        }
////        session.close();
//        return userFound;
//    }

//    @Override
//    public List<User> getUsers(String email) {
////        Session session = this.sessionFactory.getObject().getCurrentSession();
////        CriteriaBuilder b = session.getCriteriaBuilder();
////        CriteriaQuery<User> q = b.createQuery(User.class);
////        Root root = q.from(User.class);
////        q.select(root);
////        
////        if(!email.isEmpty()) {
////            Predicate p = builder.equal
////        }
//        return null;
//    }

    @Override
    public User findByUser(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);

        q.where(b.equal(root.get("username"), username));

        org.hibernate.query.Query query = session.createQuery(q);
        return (User) query.getSingleResult();
    }
}
