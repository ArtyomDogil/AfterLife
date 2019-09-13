@isTest
private class T2_OOPTasksTest {

    @isTest
    static void fullSuccessWork() {
        Integer inputValue = 7;
        List<Integer> inputList = new List<Integer>{
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12
        };

        Map<Integer, Integer> answer = T2_OOPTasks.getFirstThreeLargestElementsThanInputValue(inputValue, inputList);
        Map<Integer, Integer> test = new Map<Integer, Integer>{4 => 8, 5 => 9, 6 =>10};
        System.assertEquals(test, answer);
    }

    @isTest
    static void partialSuccessWork_TwoItems() {
        Integer inputValue = 7;
        List<Integer> inputList = new List<Integer>{
                4,
                5,
                6,
                7,
                8,
                9
        };

        Map<Integer, Integer> answer = T2_OOPTasks.getFirstThreeLargestElementsThanInputValue(inputValue, inputList);
        Map<Integer, Integer> test = new Map<Integer, Integer>{4 => 8, 5 => 9};
        System.assertEquals(test, answer);
    }

    @isTest
    static void partialSuccessWork_OneItem() {
        Integer inputValue = 7;
        List<Integer> inputList = new List<Integer>{
                4,
                5,
                6,
                7,
                9
        };

        Map<Integer, Integer> answer = T2_OOPTasks.getFirstThreeLargestElementsThanInputValue(inputValue, inputList);
        Map<Integer, Integer> test = new Map<Integer, Integer>{4 => 9};
        System.assertEquals(test, answer);
    }

    @isTest
    static void partialSuccessWork_NoOneItem() {
        Integer inputValue = 7;
        List<Integer> inputList = new List<Integer>{
                4,
                5,
                6,
                7
        };

        Map<Integer, Integer> answer = T2_OOPTasks.getFirstThreeLargestElementsThanInputValue(inputValue, inputList);
        Map<Integer, Integer> test = new Map<Integer, Integer>();
        System.assertEquals(test, answer);
    }

    @isTest
    static void failedWork_lessThan3() {
        Integer inputValue = 7;
        List<Integer> inputList = new List<Integer>{
                4,
                5
        };

        Map<Integer, Integer> answer = T2_OOPTasks.getFirstThreeLargestElementsThanInputValue(inputValue, inputList);
        Map<Integer, Integer> test = new Map<Integer, Integer>();
        System.assertEquals(test, answer);
    }

    @isTest
    static void failedWork_empty() {
        Integer inputValue = 7;
        List<Integer> inputList = new List<Integer>();

        Map<Integer, Integer> answer = T2_OOPTasks.getFirstThreeLargestElementsThanInputValue(inputValue, inputList);
        Map<Integer, Integer> test = new Map<Integer, Integer>();
        System.assertEquals(test, answer);
    }

    @isTest
    static void failedWork_null() {
        Integer inputValue = null;
        List<Integer> inputList = new List<Integer>();
        inputList = null;

        Map<Integer, Integer> answer = T2_OOPTasks.getFirstThreeLargestElementsThanInputValue(inputValue, inputList);
        Map<Integer, Integer> test = new Map<Integer, Integer>();
        System.assertEquals(test, answer);
    }

}