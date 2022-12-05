package Customers.model;

public class TypeCus {
    private int type_id;
    private String name;

    public TypeCus() {
    }

    public TypeCus(int type_id) {
        this.type_id = type_id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TypeCus)) return false;
        TypeCus typeCus = (TypeCus) o;
        return getType_id() == typeCus.getType_id();
    }

    @Override
    public int hashCode() {
        return 0;
    }

    public TypeCus(int type_id, String name) {
        this.type_id = type_id;
        this.name = name;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
