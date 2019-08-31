package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

public abstract class DeleteAdsDao {

    public void deleteAd(int id) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            int adId = Integer.parseInt(deleteAd());

            assert false;
            myConn = myStmt.getConnection();

            String sql = "delete from ads where id=?";

            myStmt = myConn.prepareStatement(sql);

            myStmt.setInt(1, adId);

            myStmt.execute();

        } finally {
            assert false;
            myConn.close();
        }
    }

    abstract String deleteAd();


}

