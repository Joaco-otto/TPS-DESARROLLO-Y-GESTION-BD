package ar.org.centro.java.curso.entidades;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class ConcesionariaAutosMotos {

        public static void AgregaVehiculos(List<Vehiculo> vehiculos) {
                vehiculos.add(new Auto("Peugeot", "206", "4", 200000.00));
                vehiculos.add(new Moto("Honda", "Titan", "125c", 60000.00));
                vehiculos.add(new Auto("Peugeot", "208", "5", 250000.00));
                vehiculos.add(new Moto("Yamaha", "YBR", "160c", 80500.50));
        }

        public static void separador() {
                System.out.println("=============================");
        }

        public void ejecutar() {
                List<Vehiculo> vehiculos = new ArrayList<>();
                AgregaVehiculos(vehiculos);
                DecimalFormat df = new DecimalFormat("$#,###.00");

                // Imprime listado de todos los vehiculos y características
                vehiculos.forEach(vehiculo -> System.out.println(vehiculo.toString()));

                separador();

                // Vehiculo más caro
                Vehiculo vehiculoCaro = vehiculos
                                .stream()
                                .max(Comparator.comparing(Vehiculo::getPrecio))
                                .get();
                System.out.println("Vehículo más caro: " + vehiculoCaro.getMarca() + " " + vehiculoCaro.getModelo());

                // Vehiculo más barato
                Vehiculo vehiculoBarato = vehiculos
                                .stream()
                                .min(Comparator.comparing(Vehiculo::getPrecio))
                                .get();
                System.out.println(
                                "Vehículo más barato: " + vehiculoBarato.getMarca() + " " + vehiculoBarato.getModelo());

                // Vehiculo que contiene en el modelo letra Y
                vehiculos
                                .stream()
                                .filter(vehiculo -> vehiculo.getModelo().toUpperCase().contains("Y"))
                                .forEach(v -> System.out.println("Vehículo que contiene en el modelo la letra 'Y':"
                                                + v.getMarca() + " " + v.getModelo() + " " + df.format(v.getPrecio())));

                separador();

                // Ordenar de mayor a menor
                System.out.println("Vehículos ordenados por precio de mayor a menor:");
                vehiculos
                                .stream()
                                .sorted(Comparator.comparing(Vehiculo::getPrecio).reversed())
                                .forEach(vehiculo -> System.out
                                                .println(vehiculo.getMarca() + " " + vehiculo.getModelo()));

                separador();

                // Vehiculos ordenados por orden natural
                System.out.println("Vehículos ordenados por orden natural (marca, modelo, precio):");
                vehiculos
                                .stream()
                                .sorted()
                                .forEach(System.out::println);
        }

}
