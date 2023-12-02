from src.common.exceptions import exception_handle
from test.unitest_help.testcase import BaseTestCase


class TestExceptions(BaseTestCase):
    def test_exceptions_handle(self):
        ex = Exception

        def handler(exception):
            raise exception

        @exception_handle([ex], handler=handler)
        def func():
            raise ex("Test exception")

        with self.assertRaises(Exception) as exception:
            func()
        self.assertEqual("Test exception", str(exception.exception))
