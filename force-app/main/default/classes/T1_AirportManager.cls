public class T1_AirportManager {

    public static Map<String, Integer> getMaxFlightRange(List<T1_Aircraft> airport) {
        Map<String, Integer> maxFlightRange = new Map<String, Integer>();
        Integer maxRange = 0;
        String nameAircraft = '';
        if (airport.isEmpty()) {
            System.debug('List of aircraft is empty');
        } else {
            for (T1_Aircraft plane : airport) {
                if (plane.flightRange > maxRange) {
                    maxRange = plane.flightRange;
                    nameAircraft = plane.nameModel;
                }
            }
        }
        maxFlightRange.put(nameAircraft, maxRange);
        return maxFlightRange;
    }

    public static Map<String, Integer> getMinFlightRange(List<T1_Aircraft> airport) {
        Map<String, Integer> minFlightRange = new Map<String, Integer>();
        Integer minRange = 0;
        String nameAircraft = '';
        if (airport.isEmpty()) {
            System.debug('List of aircraft is empty');
        } else {
            for (T1_Aircraft plane : airport) {
                if (minRange == 0) {
                    minRange = plane.flightRange;
                } else if (plane.flightRange < minRange) {
                    minRange = plane.flightRange;
                    nameAircraft = plane.nameModel;
                }
            }
        }
        minFlightRange.put(nameAircraft, minRange);
        return minFlightRange;
    }

    public static Map<String, Integer> getAverageFlightRange(List<T1_Aircraft> airport) {
        Map<String, Integer> averageFlightRange = new Map<String, Integer>();
        Integer averageRange = 0;
        Integer sumRange = 0;
        Integer numb = 0;
        if (airport.isEmpty()) {
            System.debug('List of aircraft is empty');
        } else {
            for (T1_Aircraft plane : airport) {
                sumRange += plane.flightRange;
                numb++;
                averageRange = sumRange / numb;
            }
        }
        String reportAverageRange = 'For ' + String.valueOf(numb) + ' airplanes in that airport average range';
        averageFlightRange.put(reportAverageRange, averageRange);
        return averageFlightRange;
    }

    public static Integer getSumPassengerCapacity(List<T1_Aircraft> airport) {
        Integer sumPassengerCapacity = 0;
        if (airport.isEmpty()) {
            System.debug('List of aircraft is empty');
        } else {
            for (T1_Aircraft plane : airport) {
                if (plane.passengerCapacity != 0) {
                    sumPassengerCapacity += plane.passengerCapacity;
                }
            }
        }
        return sumPassengerCapacity;
    }

    public static List<String> getNumberOfAircraft(List<T1_Aircraft> airport) {
        List<String> answerAboutAirport = new List<String>();
        Integer numberOfAllAircraft = 0;
        Integer numberOfPassengerAircraft = 0;
        Integer numberOfMilitaryAircraft = 0;
        Integer numberOfAmphibiousAircraft = 0;
        Integer numberOfTankerAircraft = 0;
        if (airport.isEmpty()) {
            System.debug('List of aircraft is empty');
        } else {
            for (Integer i = 0; i < airport.size(); i++) {
                numberOfAllAircraft++;
                if (airport[i] instanceof T1_PassengerAircraft) {
                    numberOfPassengerAircraft++;
                } else if (airport[i] instanceof T1_MilitaryAircraft) {
                    numberOfMilitaryAircraft++;
                } else if (airport[i] instanceof T1_AmphibiousAircraft) {
                    numberOfAmphibiousAircraft++;
                } else if (airport[i] instanceof T1_TankerAircraft) {
                    numberOfTankerAircraft++;
                }
            }
        }
        String reportAboutAllAircrafts = 'Number of all airplanes in that airport = ' + String.valueOf(numberOfAllAircraft);
        String reportAboutPassengerAircraft = 'Number of passenger airplanes in that airport = ' + String.valueOf(numberOfPassengerAircraft);
        String reportAboutMilitaryAircraft = 'Number of military airplanes in that airport = ' + String.valueOf(numberOfMilitaryAircraft);
        String reportAboutAmphibiousAircraft = 'Number of amphibious airplanes in that airport = ' + String.valueOf(numberOfAmphibiousAircraft);
        String reportAboutAllTankerAircraft = 'Number of tanker airplanes in that airport = ' + String.valueOf(numberOfTankerAircraft);
        answerAboutAirport.add(reportAboutAllAircrafts);
        answerAboutAirport.add(reportAboutPassengerAircraft);
        answerAboutAirport.add(reportAboutMilitaryAircraft);
        answerAboutAirport.add(reportAboutAmphibiousAircraft);
        answerAboutAirport.add(reportAboutAllTankerAircraft);
        return answerAboutAirport;
    }

}


/*
List<T1_Aircraft> airport = new List<T1_Aircraft>();
airport.add(new T1_PassengerAircraft());
airport.add(new T1_PassengerAircraft());
airport.add(new T1_MilitaryAircraft());
airport.add(new T1_MilitaryAircraft());
airport.add(new T1_MilitaryAircraft());
airport.add(new T1_MilitaryAircraft());
//airport.add(new T1_AmphibiousAircraft());
airport.add(new T1_TankerAircraft());

System.debug('getMaxFlightRange = ' + T1_AirportManager.getMaxFlightRange(airport));
System.debug('getMinFlightRange = ' + T1_AirportManager.getMinFlightRange(airport));
System.debug('getAverageFlightRange = ' + T1_AirportManager.getAverageFlightRange(airport));
System.debug('getSumPassengerCapacity = ' + T1_AirportManager.getSumPassengerCapacity(airport));
System.debug('getNumberOfAircraft = ' + T1_AirportManager.getNumberOfAircraft(airport));
 */