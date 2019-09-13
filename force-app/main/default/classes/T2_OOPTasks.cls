public class T2_OOPTasks {

    //1.	Ввести символьную строку. Найти в строке самое длинное слово и вывести его на экран. Новых строк не создавать
    //test
    //String text = '        example Of       Any  t e x t w1th looooooong word ';
    //System.debug('getTheLongestWord = ' + T2_OOPTasks.getTheLongestWord(text));
    public static String getTheLongestWord(String line) {
        String answer = line;
        if (String.isBlank(line)) {
            System.debug('String is Blank');
        } else {
            answer = answer.normalizeSpace();
            List<String> parts = answer.split(' ');
            answer = '';
            for (String items : parts) {
                if (answer.length() < items.length()) {
                    answer = items;
                }
            }
        }
        return answer;
    }

    //2.	Ввести символьную строку. Найти в строке самое короткое слово и удалить его из строки. Новых строк не создавать.
    //test 1
    public static String getDeleteTheShortestWord(String line) {
        String answer = line;
        if (String.isBlank(line)) {
            System.debug('String is Blank');
        } else {
            List<String> parts = answer.split(' ');
            Integer size = 1;
            Integer count = 0;
            for (Integer i = parts.size() - 1; i >= 0; i--) {
                if ((parts[i].length() <= size) && (parts[i].length() > 0)) {
                    count = i;
                }
            }
            parts.remove(count);
            answer = String.join(parts, ' ');
        }
        return answer;
    }

    //3.	Ввести символьную строку. Первое и второе слова в строке поменять местами. Строку до и после преобразования вывести на экран.
    //test 1
    public static Map<String, String> getSwapFirstAndSecondWords(String line) {
        String answer = line;
        Map<String, String> swapFirstAndSecondWords = new Map<String, String>{
                '1BEFORE: ' => answer
        };
        if (String.isBlank(line)) {
            System.debug('String is Blank');
        } else {
            List<String> parts = answer.split(' ');
            Integer countFirst = -1;
            Integer countSecond = -1;
            for (Integer i = 0; i < parts.size(); i++) {
                if (countFirst == -1 && countSecond == -1) {
                    if (parts[i].length() > 0) {
                        countFirst = i;
                    }
                } else if (countFirst != -1 && countSecond == -1) {
                    if (parts[i].length() > 0) {
                        countSecond = i;
                    }
                }
            }
            if (countFirst == -1 && countSecond == -1) {
                System.debug('You wrote only spaces');
            } else if (countFirst != -1 && countSecond != -1) {
                String swapper = parts[countFirst];
                parts[countFirst] = parts[countSecond];
                parts[countSecond] = swapper;
                answer = String.join(parts, ' ');
            } else {
                System.debug('You wrote only one word');
            }
        }
        swapFirstAndSecondWords.put('2AFTER: ', answer);
        return swapFirstAndSecondWords;
    }

    //4.	В массиве из 15 элементов найти номер первого отрицательного элемента. Значение элемента и его порядковый номер вывести на экран.
    //test
    //List<Integer> intList = new List<Integer>{0,2,3,4,5,6,7,8,-9,10,11,12,-13,14,-15};
    //System.debug('getNumber = ' + T2_OOPTasks.getFirstNegativeNumber(intList));
    public static Map<Integer, Integer> getFirstNegativeNumber(List<Integer> intList) {
        Map<Integer, Integer> negativeNumber = new Map<Integer, Integer>();
        if (intList == null || intList.isEmpty()) {
            System.debug('Input list of number is Null or Empty');
        } else {
            for (Integer i = 0; i < intList.size(); i++) {
                if (negativeNumber.isEmpty() && !intList.isEmpty()) {
                    if (intList[i] < 0) {
                        negativeNumber.put(i, intList[i]);
                    }
                }
            }
        }
        if (negativeNumber.isEmpty() && !intList.isEmpty()) {
            System.debug('Input list of number doesn\'t contain any negative numbers');
        }
        return negativeNumber;
    }

    //5.	Ввести символьную строку. Удалить из строки все буквы входящие в первое слово. Новых строк не создавать. Строку до и после преобразования вывести на экран.
    //test 1
    public static Map<String, String> getDeleteLetters(String line) {
        String answer = line;
        Map<String, String> deleteLetters = new Map<String, String>{
                '1BEFORE: ' => answer
        };
        if (String.isBlank(line)) {
            System.debug('String is Blank');
        } else {
            List<String> parts = answer.split(' ');
            Integer count = -1;
            for (Integer i = 0; i < parts.size(); i++) {
                if (count == -1 && parts[i].length() > 0) {
                    count = i;
                }
            }
            if (count == -1) {
                System.debug('You wrote only spaces');
            } else {
                parts = parts[count].split('');
                Set<String> charactersSet = new Set<String>(parts);
                List<String> charactersList = new List<String>(charactersSet);
                List<Integer> indexesToRemove = new List<Integer>();
                parts = answer.split('');
                for (Integer i = 0; i < parts.size(); i++) {
                    for (Integer j = 0; j < charactersList.size(); j++) {
                        if (parts[i] == charactersList[j]) {
                            indexesToRemove.add(i);
                        }
                    }
                }
                for (Integer i = indexesToRemove.size() - 1; i >= 0; i--) {
                    parts.remove(indexesToRemove[i]);
                }
                answer = String.join(parts, '');
            }
        }
        deleteLetters.put('2AFTER: ', answer);
        return deleteLetters;
    }

    //6.	В массиве из 10 элементов найти номер последнего неотрицательного элемента. Значение элемента и его порядковый номер вывести на экран.
    //test 4
    public static Map<Integer, Integer> getLastNegativeNumber(List<Integer> intList) {
        Map<Integer, Integer> negativeNumber = new Map<Integer, Integer>();
        if (intList == null || intList.isEmpty()) {
            System.debug('Input list of number is Null or Empty');
        } else {
            for (Integer i = intList.size() - 1; i >= 0; i--) {
                if (negativeNumber.isEmpty() && !intList.isEmpty()) {
                    if (intList[i] < 0) {
                        negativeNumber.put(i, intList[i]);
                    }
                }
            }
        }
        if (negativeNumber.isEmpty() && !intList.isEmpty()) {
            System.debug('Input list of number doesn\'t contain any negative numbers');
        }
        return negativeNumber;
    }

    //7.	Ввести символьную строку. Первое и последнее слова в строке поменять местами. Строку до и после преобразования вывести на экран.
    //test 1
    public static Map<String, String> getSwapFirstAndLastWords(String line) {
        String answer = line;
        Map<String, String> swapFirstAndLastWords = new Map<String, String>{
                '1BEFORE: ' => answer
        };
        if (String.isBlank(line)) {
            System.debug('String is Blank');
        } else {
            List<String> parts = answer.split(' ');
            Integer countFirst = -1;
            Integer countLast = -1;
            for (Integer i = 0; i < parts.size(); i++) {
                if (countFirst == -1) {
                    if (parts[i].length() > 0) {
                        countFirst = i;
                    }
                } else if (countFirst != -1) {
                    if (parts[i].length() > 0) {
                        countLast = i;
                    }
                }
            }
            if (countFirst == -1 && countLast == -1) {
                System.debug('You wrote only spaces');
            } else if (countFirst != -1 && countLast != -1) {
                String swapper = parts[countFirst];
                parts[countFirst] = parts[countLast];
                parts[countLast] = swapper;
                answer = String.join(parts, ' ');
            } else {
                System.debug('You wrote only one word');
            }
        }
        swapFirstAndLastWords.put('2AFTER: ', answer);
        return swapFirstAndLastWords;
    }

    //8.	 В массиве B[10] записаны целые числа от 1 до n (n ввести с клавиатуры). Упорядочить элементы массива в порядке частоты встречаемости чисел. Вывести на экран массив В до и после упорядочивания.
    //test
    //List<Integer> text = new List<Integer>{4,3,4,7,1,9,1,1,4,15,11,2};
    //System.debug('getOrderedArray = ' + T2_OOPTasks.getOrderedArray(text));
    public static Map<String, List<Integer>> getOrderedArray(List<Integer> oldList) {
        Map<String, List<Integer>> orderedArray = new Map<String, List<Integer>>{
                '1BEFORE: ' => oldList.clone()
        };
        Map<Integer, List<Integer>> myWayOfSorting = new Map<Integer, List<Integer>>();
        List<Integer> newList = new List<Integer>();
        if (oldList.isEmpty() || oldList == null) {
            System.debug('Input list of number is Empty or Null');
        } else {
            for (Integer i = 0; i < oldList.size(); i++) {
                if (!myWayOfSorting.containsKey(oldList[i])) {
                    List<Integer> numberOfRepetitionsOfNumber = new List<Integer>{
                            oldList[i]
                    };
                    myWayOfSorting.put(oldList[i], numberOfRepetitionsOfNumber);
                } else if (myWayOfSorting.containsKey(oldList[i])) {
                    List<Integer> numberOfRepetitionsOfNumber = myWayOfSorting.get(oldList[i]).clone();
                    numberOfRepetitionsOfNumber.add(oldList[i]);
                    myWayOfSorting.put(oldList[i], numberOfRepetitionsOfNumber);
                }
            }
        }
        if (!myWayOfSorting.isEmpty() && myWayOfSorting != null) {
            List<List<Integer>> newNewList = myWayOfSorting.values();
            Integer indexToReplace = 0;
            Integer searchingSize = 0;
            while (newNewList.size() > 0) {
                for (Integer i = 0; i < newNewList.size(); i++) {
                    if (newNewList[i].size() > searchingSize) {
                        searchingSize = newNewList[i].size();
                        indexToReplace = i;
                    }
                }
                newList.addAll(newNewList[indexToReplace]);
                newNewList.remove(indexToReplace);
                searchingSize = 0;
            }
            orderedArray.put('2AFTER: ', newList);
        }
        return orderedArray;
    }

    //9.	 Ввести символьную строку. Определить сколько раз в строке встречается первая буква.
    //test 1
    public static Integer getNumberOfRepetitionsOfLetter(String line) {
        Integer numberOfRepetitionsOfLetter = 0;
        if (String.isBlank(line)) {
            System.debug('String is blank');
        } else {
            String normalizeLine = line.normalizeSpace();
            String substring = normalizeLine.left(1);
            numberOfRepetitionsOfLetter = line.countMatches(substring);
        }
        return numberOfRepetitionsOfLetter;
    }

    //10.	 В массиве B[10] записаны целые числа от 1 до n (n ввести с клавиатуры). Переместить отрицательные числа в начало массива, а положительные в его конец. Вывести на экран массив В до и после перемещения чисел.
    //test
    //List<Integer> text = new List<Integer>{-4,3,0,4,71,0,1,-9,1,-1,4,15,-11,-200};
    //System.debug('getSortedArrayFromMinusToPlus = ' + T2_OOPTasks.getSortedArrayFromMinusToPlus(text));
    public static Map<String, List<Integer>> getSortedArrayFromMinusToPlus(List<Integer> inputArray) {
        List<Integer> cloneInputValue = inputArray.clone();
        Map<String, List<Integer>> sortedArray = new Map<String, List<Integer>>{
                '1BEFORE: ' => inputArray.clone()
        };
        cloneInputValue.sort();
        sortedArray.put('2AFTER: ', cloneInputValue);
        return sortedArray;
    }

    //11.	 Ввести символьную строку. Предпоследнее и последнее слова в строке поменять местами. Строку до и после преобразования вывести на экран.
    //test1
    public static Map<String, String> getSwapFirstAndPenultimateWords(String line) {
        String answer = line;
        Map<String, String> swapFirstAndPenultimateWords = new Map<String, String>{
                '1BEFORE: ' => answer
        };
        if (String.isBlank(line)) {
            System.debug('String is blank');
        } else {
            List<String> parts = answer.split(' ');
            Integer countFirst = -1;
            Integer countPenultimate = -1;
            Integer countLast = -1;
            for (Integer i = parts.size() - 1; i >= 0; i--) {
                if (countLast == -1 && countPenultimate == -1 && countFirst == -1) {
                    if (parts[i].length() > 0) {
                        countLast = i;
                    }
                } else if (countLast != -1 && countPenultimate == -1 && countFirst == -1) {
                    if (parts[i].length() > 0) {
                        countPenultimate = i;
                    }
                } else if (countLast != -1 && countPenultimate != -1) {
                    if (parts[i].length() > 0) {
                        countFirst = i;
                    }
                }
            }
            if (countLast != -1 && countPenultimate == -1 && countFirst == -1) {
                System.debug('You wrote only one word');
            } else if (countLast != -1 && countPenultimate != -1 && countFirst == -1) {
                System.debug('You wrote only two words');
            } else if (countLast != -1 && countPenultimate != -1 && countFirst != -1) {
                String swapper = parts[countFirst];
                parts[countFirst] = parts[countPenultimate];
                parts[countPenultimate] = swapper;
                answer = String.join(parts, ' ');
            }
        }
        swapFirstAndPenultimateWords.put('2AFTER: ', answer);
        return swapFirstAndPenultimateWords;
    }

    //12.	 В массиве B[10] записаны целые числа от 1 до n (n ввести с клавиатуры). Выполнить замену первого и последнего, второго и предпоследнего и т.д. элементов. Вывести на экран массив В до и после замены.
    //test 10
    public static Map<String, List<Integer>> getFlipArray(List<Integer> inputArray) {
        Map<String, List<Integer>> flipArray = new Map<String, List<Integer>>{
                '1BEFORE: ' => inputArray.clone()
        };
        List<Integer> flipList = new List<Integer>();
        for (Integer i = inputArray.size() - 1; i >= 0; i--) {
            flipList.add(inputArray[i]);
        }
        flipArray.put('2AFTER: ', flipList);
        return flipArray;
    }

    //13.	 Ввести символьную строку. Удалить из строки все лишние пробелы, оставив их только между словами (по одному). Новых строк не создавать. Строку до и после преобразования вывести на экран.
    //test 1
    public static Map<String, String> getNormalizeSpaceInLine(String inputString) {
        Map<String, String> normalizeSpaceInLine = new Map<String, String>{
                '1BEFORE: ' => inputString,
                '2AFTER: ' => inputString.normalizeSpace()
        };
        return normalizeSpaceInLine;
    }

    //14.	 В массиве B[10] записаны целые числа от 1 до n (n ввести с клавиатуры). Найти и вывести на экран два первых максимальных числа.
    //test
    //List<Integer> text = new List<Integer>{-4,3,0,4,71,0,1,-9,1,-1,4,15};
    //System.debug('getTwoFirstMaxNumber = ' + T2_OOPTasks.getTwoFirstMaxNumber(text));
    public static List<Integer> getTwoFirstMaxNumber(List<Integer> inputList) {
        List<Integer> cloneOfInputList = inputList.clone();
        cloneOfInputList.sort();
        List<Integer> twoFirstMaxNumber = new List<Integer>{
                cloneOfInputList[cloneOfInputList.size() - 1], cloneOfInputList[cloneOfInputList.size() - 2]
        };
        return twoFirstMaxNumber;
    }

    //15.	 Ввести символьную строку, состоящую не более чем из 30 символов. Пропорционально добавить пробелы между словами так, чтобы длина строки стала 40 символов. Новых строк не создавать. Строку до и после преобразования вывести на экран.
    //test
    //String text = '    one to  one with experiments texts fot for  fog trata ta ta ta and some i some text   ';
    //System.debug('getTheLongestWord = ' + T2_OOPTasks.get30SymbTo40Symb(text));
    public static Map<String, String> getSymbToSymb(String inputText) {
        String answer = inputText;
        System.debug('START inputText.length()= ' + answer.length());
        Map<String, String> symbToSymb = new Map<String, String>{
                '1BEFORE: ' => answer
        };
        if (String.isBlank(answer)) {
            System.debug('String is blank');
        } else {
            Integer maxSize = 30;
            Integer finalSize = 40;
            answer = answer.normalizeSpace();
            if (answer.length() > maxSize) {
                answer = answer.substring(0, maxSize);
            }
            System.debug('MIDDLE inputText.length()= ' + inputText.length());
            List<String> words = inputText.split(' ');
            Integer fullRound = (finalSize - inputText.length()) / (words.size() - 1);
            Integer remainder = Math.mod((finalSize - inputText.length()), (words.size() - 1));
            if (fullRound != 0) {
                for (Integer i = 0; i < words.size() - 1; i++) {
                    words[i] = words[i].rightPad(words[i].length() + fullRound);
                }
            }
            for (Integer i = 0; i < remainder; i++) {
                words[i] = words[i].rightPad(words[i].length() + 1);
            }
            inputText = String.join(words, ' ');
        }
        symbToSymb.put('2AFTER: ', inputText);
        System.debug('FINISH inputText.length()= ' + inputText.length());
        return symbToSymb;
    }

    //16.	 В массиве B[12] (целые числа) найти первые три элемента большие значения введенного с клавиатуры. Вывести порядковые номера элементов и их значения.
    //test
    /*Integer numb = 7;
    List<Integer> listik= new List<Integer>{
        4,
        5,
        6,
        7,
        8,
        9,
        10
    };
    System.debug('test = ' + T2_OOPTasks.getFirstThreeLargestElementsThanInputValue(numb, listik));*/
    public static Map<Integer, Integer> getFirstThreeLargestElementsThanInputValue(Integer inputValue, List<Integer> inputList) {
        Map<Integer, Integer> resultToResponse = new Map<Integer, Integer>();
        Integer counter = 0;
        if (inputValue == null || inputList == null) {
            System.debug('The input data has a null-point value!!!');
        } else if (inputList.isEmpty()) {
            System.debug('The input list doesn\'t contain any data!');
        } else if (inputList.size() < 3) {
            System.debug('The input list doesn\'t contain the minimum required data equal to three elements to comparison!');
        } else {
            for (Integer i = 0; i < inputList.size(); i++) {
                if (counter < 3 && inputValue < inputList[i]) {
                    resultToResponse.put(i, inputList[i]);
                    counter++;
                }
            }
            counter = 0;
            if (resultToResponse.size() < 3) {
                System.debug('My apologize, but I found ' + resultToResponse.size() + ' element(s) that is/(are) larger than ' + inputValue);
            }
        }
        return resultToResponse;
    }

    //17.	 Ввести символьную строку. Выполнить переворот каждого слова в строке (заменив первую букву с последней, вторую с предпоследней и т.д.). Новых строк не создавать. Строку до и после преобразования вывести на экран.
    //test
    //String text = '    one to  one with experiments   ';
    //System.debug('getReverseOfLine = ' + T2_OOPTasks.getReverseOfLine(text));
    public static Map<String, String> getReverseOfLine(String inputLine) {
        String answer = inputLine;
        Map<String, String> reverseOfLine = new Map<String, String>{
                '1BEFORE: ' => inputLine
        };
        List<String> words = answer.split(' ');
        for (Integer i = 0; i < words.size(); i++) {
            words[i] = words[i].reverse();
        }
        answer = String.join(words, ' ');
        reverseOfLine.put('2AFTER: ', answer);
        return reverseOfLine;
    }

    //18.	 В массиве B[15] определить начальный и конечный индексы элементов, составляющих максимальную по длине неубывающую последовательность. Вывести на экран массив В и найденную последовательность.
    //test
    public static Map<List<Integer>, Map<List<Integer>, List<Integer>>> getSequenceOfNonDecreasingNumbers(List<Integer> inputList) {
        Map<List<Integer>, Map<List<Integer>, List<Integer>>> answer = new Map<List<Integer>, Map<List<Integer>, List<Integer>>>();
        if (inputList == null || inputList.isEmpty()) {
            System.debug('inputList is null or empty');
        } else {
            List<Integer> sequenceOfNonDecreasingNumbers = new List<Integer>();
            Integer firstItem = 0;
            Integer lastItem = 0;
            Integer interimFirstItem = 0;
            Integer interimLastItem = 0;
            for (Integer i = 1; i < inputList.size(); i++) {
                if (inputList[i] > inputList[i - 1]) {
                    interimLastItem = i;
                    if ((lastItem - firstItem) < (interimLastItem - interimFirstItem) && (i == inputList.size() - 1)) {
                        firstItem = interimFirstItem;
                        lastItem = interimLastItem;
                    }
                } else {
                    if ((lastItem - firstItem) < (interimLastItem - interimFirstItem)) {
                        firstItem = interimFirstItem;
                        lastItem = interimLastItem;
                    }
                    interimFirstItem = i;
                    interimLastItem = i;
                }
            }

            for (Integer i = firstItem; i <= lastItem; i++) {
                sequenceOfNonDecreasingNumbers.add(inputList[i]);
            }

            List<Integer> firstAndLastIndexes = new List<Integer>{
                    firstItem,
                    lastItem
            };

            Map<List<Integer>, List<Integer>> formattedDataToAnswer = new Map<List<Integer>, List<Integer>>{
                    firstAndLastIndexes => sequenceOfNonDecreasingNumbers
            };

            answer.put(inputList.clone(), formattedDataToAnswer);
        }
        return answer;
    }
    //19.	 Ввести символьную строку. Заменить в строке все первые буквы слов на соответствующие заглавные. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //20.	 В массиве X[15] целых чисел найти сумму наибольшего количества чисел, произведение которых меньше M (ввести с клавиатуры).
    //21.	 Ввести символьную строку. Удалить из строки все слова содержащие не более 4 букв. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //22.	 Ввести массив X[15]. Все положительные элементы массива расположить в порядке возрастания, а отрицательные в порядке убывания. Относительного расположения положительных и отрицательных элементов не менять. Исходный и полученный массив вывести на экран.
    //23.	 Ввести символьную строку. Удалить из строки все буквы встречающиеся в строке более 2 раз. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //24.	 Ввести матрицу целых чисел A[5][5]. Рассортировать элементы побочной диагонали матрицы в порядке убывания. Исходную преобразованную матрицы вывести на экран.
    //25.	 Ввести символьную строку. Ввести с клавиатуры символ, выполнить удаление этого символа из первого и последнего слов. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //26.	 Ввести матрицу целых чисел A[5][5]. Рассортировать элементы главной диагонали матрицы в порядке возрастания. Исходную преобразованную матрицы вывести на экран.
    //27.	 Ввести символьную строку. Вывести на экран все символы, повторяющиеся в строке более 1 раза. Новых строк не создавать.
    //28.	 Ввести матрицу целых чисел A[5][5]. Составить программу вычисления следа квадратной матрицы. Следом квадратной матрицы называется сумма элементов расположенных на главной диагонали. Исходную матрицу и результат вывести на экран.
    //29.	 Ввести 2 символьные строки. Удалить из первой строки все символы, содержащиеся во второй строке. Строки до и после преобразования вывести на экран.
    //30.	 В матрице  X[5][6] в столбце, содержащем максимальное количество отрицательных элементов, отрицательные заменить на единицу.
    //31.	 Ввести число N и строку длиной N символов. В строке, среди знаков которой могут встретиться ’(’ и ’)’, проверить предшествует ли каждая открывающая скобка каждой закрывающей.
    //32.	 Расположить элементы матрицы M[5][5], так чтобы на побочной диагонали были бы максимальные элементы строк.
    //33.	 Ввести строку из n (n≤6) знаков и строку из k (k≤80) знаков. Определить количество вхождений строки из n знаков в строку из k знаков.
    //34.	 Расположить элементы матрицы M[5][5], так чтобы на главной диагонали были бы минимальные элементы столбцов.
    //35.	 Ввести символьную строку. Удалить из строки все символы не являющиеся буквами латинского алфавита. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //36.	 Составить программу обмена в матрице A[5][5] элементов, находящихся на главной диагонали, с соответствующими элементами первого столбца.
    //37.	 Ввести символьную строку, содержимое которой – несколько целых чисел. Вычислить сумму этих чисел. Строку и полученную сумму вывести на экран
    //38.	 Для матрицы M[5][5] найти минимальный элемент лежащий выше побочной диагонали и поменять его с симметричным элементом, лежащим ниже этой диагонали.
    //39.	 Ввести символьную строку. Выполнить переворот каждого слова в строке (заменив первую букву с последней, вторую с предпоследней и т.д.). Новых строк не создавать. Строку до и после преобразования вывести на экран
    //40.	 В матрице А[4][6] определить номер столбца сумма элементов которого минимальна. На экран вывести исходную матрицу, сумму элементов столбцов и номер столбца с наименьшей суммой.
    //41.	 Используя указатель рассортировать массив строк в алфавитном порядке.
    //42.	 В матрице А[5][6], в каждой строке, нулевые элементы сместить в конец строки не нарушив порядка следования ненулевых.
    //43.	 Ввести символьную строку. Удалить из строки введенный с клавиатуры символ. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //44.	 В матрице A[4][5] найти седловые точки (если они имеются). Седловая точка – это элемент матрицы максимальный в строке и минимальный в столбце. Вывести их значения и их координаты в матрице.
    //45.	 Ввести символьную строку. Вывести на экран последнее слово. Новых строк не создавать.
    //46.	 Транспонировать квадратную матрицу, используя только оператор while. Новой матрицы не создавать. Вывести исходную и транспонированную матрицы.
    //47.	 Ввести число N (N≤100). Сформировать символьную строку, содержащую это число, записанное буквами  (например, сто пятьдесят шесть). Введенное число и содержимое строки вывести на экран.
    //48.	 Транспонировать квадратную матрицу, используя только оператор do{ }while. Новой матрицы не создавать. Вывести исходную и транспонированную матрицы.
    //49.	 Ввести две символьных строки. Выполнить вставку второй строки в первую с позиции, введенной с клавиатуры. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //50.	 Транспонировать квадратную матрицу, используя только оператор for. Новой матрицы не создавать. Вывести исходную и транспонированную матрицы.
    //51.	 Ввести две символьных строки. Выполнить поиск второй строки в первой и вывести номер позиции первой строки, с которой вторая строка содержится в ней. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //52.	 Для матрицы M[5][5] найти минимальный элемент лежащий выше главной диагонали и поменять его с симметричным элементом, лежащим ниже этой диагонали.
    //53.	 Ввести две символьных строки. Выполнить вставку второй строки в первую с позиции, введенной с клавиатуры. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //54.	 Ввести 2 массива X[4] и Y[5] упорядоченные по возрастанию. Сформировать массив Z[4+5] упорядоченный по возрастанию путем перезаписи информации из массивов X и Y. Сортировку не использовать.
    //55.	 Ввести символьную строку. Выполнить перемещение всех цифровых символов в конец строки. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //56.	 Ввести 2 массива X[4] и Y[5] упорядоченные по возрастанию. Сформировать массив Z[4+5] упорядоченный по убыванию путем перезаписи информации из массивов X и Y. Сортировку не использовать.
    //57.	 Ввести символьную строку. Выполнить перемещение всех цифровых символов в начало строки. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //58.	 Разработать программу перевода числа (например,  124,341) из десятичной системы счисления в систему счисления с основанием ≤ 20.
    //59.	 Ввести символьную строку. Определить число вхождений в строку каждой буквы. Новых строк не создавать.
    //60.	 Ввести 2 массива X[5] и Y[4] упорядоченные по убыванию. Сформировать массив Z[5+4] упорядоченный по убыванию путем перезаписи информации из массивов X и Y. Сортировку не использовать.
    //61.	 Ввести две символьных строки. Выполнить вставку второй строки в первую с позиции, введенной с клавиатуры. Строки до и после преобразования вывести на экран
    //62.	 Ввести 2 массива X[3] и Y[5] упорядоченные один по убыванию, второй по возрастанию. Сформировать массив Z[3+5] упорядоченный по возрастанию путем перезаписи информации из массивов X и Y. Сортировку не использовать.
    //63.	 Ввести две символьных строки. Выполнить удаление второй строки из  первой (если вторая входит в первую как подстрока). Строки до и после преобразования вывести на экран
    //64.	 Ввести 2 массива X[3] и Y[5] упорядоченные один по убыванию, второй по возрастанию. Сформировать массив Z[3+5] упорядоченный по убыванию путем перезаписи информации из массивов X и Y. Сортировку не использовать.
    //65.	 Ввести две символьных строки. Определить какая из введенных строк длиннее и к ней добавить вторую строку. Строки до и после преобразования вывести на экран
    //66.	 Выбрать из матрицы M[5][5]  правый боковой треугольник элементов (образованный элементами, лежащими ниже побочной и выше главной диагоналей) и найти в нем максимальный элемент.
    //67.	 Ввести символьную строку. Выполнить удаление из строки слов с числом  букв более 5. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //68.	 В матрице A[5][4] действительных чисел, в каждой строке, поменять местами max и min элементы.
    //69.	 Используя указатель рассортировать массив строк в алфавитном порядке.
    //70.	 В массиве B[10] записаны целые числа от 1 до n (n ввести с клавиатуры). Переместить отрицательные числа в начало массива, положительные в его конец, а нулевые элементы оставить на месте. Вывести на экран массив В до и после перемещения чисел.
    //71.	 Ввести символьную строку. Выполнить удаление из строки слов содержащих малые латинские символы. Новых строк не создавать. Строку до и после преобразования вывести на экран
    //72.	 Вести целочисленный массив B[10]. Найти и вывести на экран все его элементы меньшие соседних (т.е. такой B[i], что В[i-1]>В[i] и В[i]<B[i+1]).
    //73.	 Ввести целочисленный массив B[10]. Проверить составляют ли его элементы последовательность Фибоначчи (элемент этой последовательности равен сумме предыдущих двух).
    //74.	 В main() ввести строку, в функции выполнить реверсивный переворот каждого слова. Результат вывести в main().
    //75.	 Выполнить сортировку i-ой строки матрицы размерностью N x M методом “через отбор”.
    //76.	 В main() ввести строку. В функции ввести символ и выполнить удаление его из строки. Дополнительных строк не использовать
    //77.	 Используя указатель на матрицу размерностью N x M найти в ней элемент, находящийся на пересечении строки с max суммой элементов и столбца с min суммой элементов. Вывести на экран значение найденного элемента и номер строки и столбца.
    //78.	 Обнулить все совпавшие элементы главной диагонали квадратной матрицы целых чисел. В качестве оператора цикла использовать только оператор while. Дополнительных массивов не использовать.
    //79.	 Ввести символьную строку. Удалить из строки все пробелы оставив только по одному между словами. Дополнительных строк не использовать.
    //80.	 В main() ввести два массива целых чисел рассортированных в порядке возрастания. В функции не используя сортировки, получить общий упорядоченный по убыванию массив и вывести его в main().
    //81.	 В main() ввести 2 строки. В функции выполнить удаление символов первой строки из второй. Преобразованную строку вывести в main().
    //82.	 В массив A[n] вводить числа с одновременным его упорядочиванием по возрастанию (т.е. числа сразу размещать в нужное место массива). Сортировок не использовать.
    //83.	 В main() вести строку. В функции в каждом слове первую букву поменять с последней. Строку до и после преобразования вывести на экран.
    //84.	 Расположить элементы матрицы M[n][n], так чтобы на главной диагонали были бы максимальные элементы соответствующей строки.
    //85.	 В main() вести строку. В функции заменить пробелами все повторяющиеся в ней символы кроме каждого первого. Исходную и преобразованную строку вывести на экран в main().
    //86.	 В main() вести матрицу M[n][n]. В функции найти столбец расположенный ниже главной диагонали с максимальной суммой элементов. Вывести найденный столбец.
    //87.	 Ввести символьную строку. Определить сколько различных символов первого слова встречаются в последующих словах.
    //88.	 В main() вести массив M[n]содержащий числа от 1 до 99. За один проход по массиву определить сколько чисел и какого десятка содержится в массиве.
    //89.	 Ввести символьную строку. В функции вывести на экран все слова строки длина которых больше длины первого слова.
    //90.	 В main() вести матрицу M[n][k]. В функции, для каждой строки матрицы, минимальный элемент поменять местами с первым элементом строки. Преобразованную матрицу вывести в main(). Дополнительных массивов и матриц не использовать.
    //91.	 Ввести символьную строку. В функции найти и вывести на экран слова-перевертыши (читающиеся одинаково с начала и конца).
    //92.	 В main() вести массив M1[n] упорядоченных по возрастанию чисел и М2[k] не упорядоченных чисел. В функции определить (и вывести на экран) элементы массива М2 содержащиеся в массиве М1.
    //93.	 Ввести символьную строку. В функции найти и вывести на экран слова, состоящие только из цифр.
    //94.	 В main() вести матрицу M[n][k]. Найти max элемент и переместить его в M[0][0]. При этом единственным допустимым преобразованием является перемещение строки и столбца содержащего max элемент. Преобразованную матрицу вывести в main(). Дополнительных массивов и матриц не использовать.
    //95.	 Ввести символьную строку. В функции ввести символ и вывести на экран последнее слово, в котором  встретился этот символ.
}