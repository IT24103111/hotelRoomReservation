package lk.sliit.hotelroomreservation;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/awards-news/get")
public class AwardNewsGetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        List<NewsItem> newsItems = NewsFileHandler.readNewsItems();
        Gson gson = new Gson();
        String json = gson.toJson(newsItems);

        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }
}