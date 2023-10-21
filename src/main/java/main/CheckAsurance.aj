package main;
import java.util.Scanner;

public aspect CheckAsurance {
	
	pointcut verifyAssurance():execution(void PetStore.makeAppointment(..));
	
	before():verifyAssurance() {
		System.out.println("Name of your pet: ");
		Scanner sc = new Scanner(System.in);
		String nombre = sc.nextLine();
		
		boolean valid = false;		
		for (User user: PetStore.users) {
			if (user.getPetName().equals(nombre)) {
				valid = true;
			}
		}
		
		if (valid) {
			System.out.println("Welcome " + nombre);
			System.out.println("You are able to use this service");
		} else {
			System.out.println("You are not able to use this service");
			System.exit(0);
		}	
	}
	
	after():verifyAssurance() {
		System.out.println("Request was executed successfully ");
	}

}
