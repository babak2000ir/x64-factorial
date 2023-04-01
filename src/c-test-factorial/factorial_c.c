int factorial(int n)
{
    if (n == 0) {
        return 1;
    }

    int result = 1;
    for (int c = 1; c <= n; ++c) {
        result = result * c;
    }

    return result;
}

int main(int argc, char* argv)
{
    return 0;
}