require "base64"

class Libmspack < Formula
  desc "A library for some loosely related Microsoft compression formats, CAB, CHM, HLP, LIT, KWAJ and SZDD"
  homepage "http://www.cabextract.org.uk/libmspack/"
  url "http://www.cabextract.org.uk/libmspack/libmspack-0.5alpha.tar.gz"
  sha256 "8967f275525f5067b364cee43b73e44d0433668c39f9376dfff19f653d1c8110"
  version "0.5alpha"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    File.open("normal_2files_1folder.cab", "w") { |file| file.write(Base64.decode64(
      "TVNDRgAAAAD9AAAAAAAAACwAAAAAAAAAAwEBAAIAAAAiBgAAXgAAAAEAAABNAAAAAAAAAAAAbCK6WSAAaGVsbG8uYwBKAAAATQAAAAAAbCLnWSAAd2VsY29tZS5jAL1apjCXAJcAI2luY2x1ZGUgPHN0ZGlvLmg+DQoNCnZvaWQgbWFpbih2b2lkKQ0Kew0KICAgIHByaW50ZigiSGVsbG8sIHdvcmxkIVxuIik7DQp9DQojaW5jbHVkZSA8c3RkaW8uaD4NCg0Kdm9pZCBtYWluKHZvaWQpDQp7DQogICAgcHJpbnRmKCJXZWxjb21lIVxuIik7DQp9DQoNCg=="
    )) }

    # TODO: Find a test program that lists the files and folder in the above cabinet.
  end
end
