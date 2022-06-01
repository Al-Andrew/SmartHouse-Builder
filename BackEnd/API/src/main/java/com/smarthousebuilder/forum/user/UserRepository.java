package com.smarthousebuilder.forum.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    @Query("SELECT u from User u where u.id = ?1")
    User findUserById(int id);
    @Query("SELECT u FROM User u WHERE u.nameUser = ?1")
    Optional<User> findUserByName(String name);

    @Query("SELECT u FROM User u WHERE u.emailUser= ?1")
    Optional<User> findUserByEmail(String email);

    //@Query("SELECT u FROM User u WHERE u.nameUser=?1 OR u.emailUser= ?2")
    //Optional<User> findUserByNameOrEmail(String name, String email);


}