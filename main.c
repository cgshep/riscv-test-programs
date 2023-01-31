#include "sha3.h"

#include <string.h>
#include <stdio.h>

#define SHA3_BUF_LEN	32

int run_sha3()
{
	unsigned char* sha3_test_msg = "This is a test message for SHA-3.";
	unsigned char sha3_buf[SHA3_BUF_LEN];
	sha3(sha3_test_msg, strlen(sha3_test_msg), sha3_buf, SHA3_BUF_LEN);
	return 0;
}

int main(int argc, char** argv)
{
    printf("Running benchmarks...\n");
    int ret = run_sha3();
    return ret;
}
