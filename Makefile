CXX = clang++
LD  = clang++
RM  = rm -f
CXXFLAGS = -Wall -Isrc
LDFLAGS  = $(CXXFLAGS) -lboost_signals-mt -lboost_system-mt -lboost_thread-mt

TARGET  = jaguar
OBJECTS = src/assign_id.cc.o src/jaguar.cc.o src/jaguar_helper.cc.o src/jaguar_bridge.cc.o
TEST_TARGET  = $(TARGET)_test
TEST_OBJECTS = test/jaguar_bridge_test.cc.o src/jaguar.cc.o src/jaguar_helper.cc.o src/jaguar_bridge.cc.o

.PHONY: all test clean
.SECONDARY:	

all: $(TARGET)

test: $(TEST_TARGET)

clean:
	$(RM) $(TARGET) $(OBJECTS) $(TEST_OBJECTS)

$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

$(TEST_TARGET): $(TEST_OBJECTS)	
	$(LD) $(LDFLAGS) -lgmock -lgtest -lgtest_main -o $@ $^

%.cc.o: %.cc
	$(CXX) $(CXXFLAGS) -c -o $@ $^	