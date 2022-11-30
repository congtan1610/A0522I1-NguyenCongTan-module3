package com.PTBac2;

public class Main {

    public static void main(String[] args) {
        // write your code here
    }

    public static void pt2(float a, float b, float c) {
        if (a == 0) {
            if (b == 0) {
                if (c == 0) System.out.println("pt co vo so nghiem");
                else System.out.println("pt vo nghiem");
            } else {
                if (c == 0) System.out.println("pt co nghiem duy nhat la x=0");
                else System.out.println("pt co nghiem duy nhat la x=" + ((-c) / b));
            }
        } else {
            Float delta;
            delta = b * b - 4 * a * c;
            if (delta < 0) {
                System.out.println("pt vo nghiem");
            } else if (delta == 0) {
                System.out.println("pt co nghiem kep la: " + (-b / (2 * a)));
            } else
                System.out.println("pt co 2 nghiem: x1= " + ((-b + Math.sqrt(delta)) / (2 * a)) + ", x2= " + ((-b - Math.sqrt(delta)) / (2 * a)));
        }

    }
}
