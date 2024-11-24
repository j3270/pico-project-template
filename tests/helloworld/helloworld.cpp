
#include "iostream"
#include "CppUTest/TestHarness.h"
#include "CppUTestExt/MockSupport.h"

extern "C" {
    // c code include
}

TEST_GROUP(HelloWorld)
{
    void setup() 
    { 
    }

    void teardown() 
    { 
    }
};

TEST(HelloWorld, TestGroupBuilds)
{
    std::cout << std::endl << "Hello World test builds" << std::endl;
    CHECK_TRUE(true);
};
