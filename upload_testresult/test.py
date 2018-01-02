import time
import unittest
import xmlrunner

class Test(unittest.TestCase):
    def test_success(self):
        time.sleep(1)

    def test_failed(self):
        raise Exception("Something went wrong")

def main():
    with open('results.xml', 'wb') as output:
        unittest.main(testRunner=xmlrunner.XMLTestRunner(output=output))

if __name__ == '__main__':
    main()
