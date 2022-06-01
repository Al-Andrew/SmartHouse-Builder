package com.smarthousebuilder.SHB;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SetupRepository extends JpaRepository<Setup, Integer> {

        @Query("SELECT u from Setup u where u.id = ?1")
        Setup findSetupById(int id);
        @Query("SELECT u from Setup u")
        List<Setup> findAll();
        @Query("SELECT u from Setup u where u.userId= ?1")
        List<Setup> findSetupByUserId(int id);
}
