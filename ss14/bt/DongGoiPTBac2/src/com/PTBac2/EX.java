package com.PTBac2;

import java.util.Scanner;

public class EX {
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        System.out.println("---pt bac 2---");
        System.out.print("Nhap a: ");
        Float a=Float.parseFloat(in.nextLine());
        System.out.print("Nhap b: ");
        Float b=Float.parseFloat(in.nextLine());
        System.out.print("Nhap c: ");
        Float c=Float.parseFloat(in.nextLine());
        Main.pt2(a,b,c);
    }
}
