trigger T7_UpdatePhoneOnAccount on Account (before update) {
    new T7_UpdatePhoneOnAccountHandler().run();
}