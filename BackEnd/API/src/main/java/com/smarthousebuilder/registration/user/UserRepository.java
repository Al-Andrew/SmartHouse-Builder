package com.smarthousebuilder.registration.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    @Query("SELECT u from User u where u.id = ?1")
    User findUserById(int id);
    @Query("SELECT u FROM User u WHERE u.nameUser = ?1")
    Optional<User> findUserByName(String name);

    @Query("SELECT u FROM User u WHERE u.emailUser= ?1")
    Optional<User> findUserByEmail(String email);

    @Query("SELECT u from User u WHERE u.passUser = ?1 AND u.nameUser = ?2")
    Optional<User> findUserByPasswordAndAndNameUser(String password, String nameUser);

    @Query("SELECT u from User u WHERE u.passUser = ?1 AND u.emailUser = ?2")
    Optional<User> findUserByPasswordAndAndEmailUser(String password, String emailUser);

    //@Query("SELECT u FROM User u WHERE u.nameUser=?1 OR u.emailUser= ?2")
    //Optional<User> findUserByNameOrEmail(String name, String email);


}