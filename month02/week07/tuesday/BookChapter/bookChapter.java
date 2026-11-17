
public class bookChapter
{
    private String chapterTitle;
    private int totalPages;
    private int pagesRead;

    public bookChapter()
    {
        pagesRead = 0;
    }

    public void readPage(int count)
    {
        pagesRead = pagesRead + count;
    }
    
    public int getPagesLeft()
    {
        return totalPages - pagesRead;
    }
    
    public double estimeMinutesToFinish(double minutesPerPage)
    {
        return getPagesLeft() * minutesPerPage;
    }
}