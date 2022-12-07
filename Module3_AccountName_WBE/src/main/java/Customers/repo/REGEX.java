package Customers.repo;

public class REGEX {
    public REGEX() {
    }

    public final String email="^[\\w.]+@[a-zA-Z0-9]+(\\.[a-zA-Z0-9]+){1,2}$";
    public final String day="\\d{4}-\\d{1,2}-\\d{1,2}";
    public final String chinOrMuoiHai="^([\\d]{9}|[\\d]{12})$";
}
