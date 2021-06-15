package test;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageInterceptor;
import com.library.pojo.Book;
import com.library.service.BookService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/book-context.xml")
public class test {

    @Autowired
    private BookService bookService;

    @Test
    public void testFindpage(){
        PageHelper.startPage(1,10);
        Book book = new Book();
        ArrayList<Book> allBooks = bookService.getAllBooks();
        PageInfo<Book> bookPageInfo =new PageInfo<>(allBooks);

        for (Book book1 : bookPageInfo.getList()) {
            System.out.println(book1.getBookId()+""+book1.getName());
        }

        System.out.println("总行数="+bookPageInfo.getTotal());
        System.out.println("当前页="+bookPageInfo.getPageNum());
        System.out.println("每页行数="+bookPageInfo.getPageSize());
        System.out.println("总页数="+bookPageInfo.getPages());
        System.out.println("起始行数="+bookPageInfo.getStartRow());
    }
}
