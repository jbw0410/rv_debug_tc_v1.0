#include <stdint.h>

char text[] = "Vafgehpgvba frgf jnag gb or serr!";
// Don't use the stack, because sp isn't set up.
volatile int wait = 1;
volatile uint32_t tohost __attribute__((section(".tohost")));
volatile uint32_t fromhost __attribute__((section(".fromhost")));
int main()
{
    while (wait)
        ;

    // Doesn't actually go on the stack, because there are lots of GPRs.
    int i = 0;
    while (text[i]) {
        char lower = text[i] | 32;
        if (lower >= 'a' && lower <= 'm')
            text[i] += 13;
        else if (lower > 'm' && lower <= 'z')
            text[i] -= 13;
        i++;
    }

done:
    while (!wait)
        ;
}
