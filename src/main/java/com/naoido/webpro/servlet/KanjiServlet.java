package com.naoido.webpro.servlet;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import com.naoido.webpro.dao.KanjiDao;
import com.naoido.webpro.dao.ResultDao;
import com.naoido.webpro.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/KanjiServlet")
public class KanjiServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String[] nameList = name.split("");
        int kakusuu = 0;
        try {
            for(String i: nameList) {
                kakusuu += KanjiDao.kanji(i);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }

        String[] now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")).split("-");
        int nowdate = 0;
        for(String i: now) {
            nowdate += Integer.parseInt(i);
        }
        Random rand = new Random(nowdate + kakusuu);
        int fortune = rand.nextInt(8);

        String luck;
        if(fortune == 0) {
            luck = "大吉";
        }else if(fortune == 1) {
            luck = "中吉";
        }else if(fortune == 2) {
            luck = "小吉";
        }else if(fortune == 3) {
            luck = "吉";
        }else if(fortune == 4) {
            luck = "末吉";
        }else if(fortune == 5) {
            luck = "凶";
        }else if(fortune == 6) {
            luck = "大凶";
        }else {
            luck = "超大吉";
        }
        session.setAttribute("luck", luck);
        session.setAttribute("kakusuu", kakusuu);

        User user = (User) session.getAttribute("user");
        ResultDao.INSTANCE.saveResult(user.getUsername(), "画数占いの結果", luck);

        RequestDispatcher rd = request.getRequestDispatcher("/kanji-result.jsp");
        rd.forward(request, response);
    }

}