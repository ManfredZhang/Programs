#include <am.h>
#include <amdev.h>
#include <stdarg.h>
#include <string.h>

int printf(const char *string, ...) {
		char buffer[999];
		memset(buffer, 0 ,sizeof(buffer));

		int temp = 0;
		va_list arg;

		const char* p_string = NULL;
		char* p_buffer = buffer;
		char* p_temp   = NULL;

		int counter = 0;
		int number  = 0;
		int foo     = 0;

		va_start(arg,string);

		for(counter = 0,p_string = string;*(p_string) != '\0';) {
				switch(*p_string) {
						case '%':
								p_string++;

								switch(*p_string) {
										case 'd':
												p_string++;
												number = 0;
												temp = va_arg(arg,int);
												if (temp == 0) {
														*(p_buffer) = '0';
														p_buffer++;
														break;
												}
												foo = temp;
												while(foo) {
														number++;
														counter++;
														foo /= 10;
												}
												foo = temp;
												int nnum = number;
												while(nnum) {
														*(p_buffer+nnum-1) = '0' + (foo%10);
														foo /= 10;
														nnum--;
												}
												p_buffer += number;
												break;

										case 'c':
												p_string++;
												temp = va_arg(arg,int);
												*(p_buffer++) = temp;
												break;

										case 's':
												p_string++;
												p_temp = va_arg(arg,char*);
												int len = 0;
												while (1) {
														if (*(p_temp + len))
																len++;
														else break;
												}

												for (int i = 0; i < len; i++) {
														*(p_buffer++) = *(p_temp++);
														counter++;
												}
												break;

										default:
												break;

								}
								break;

						default:
								*(p_buffer++) = *(p_string++);
								counter++;
				}
		}

		va_end(arg);

		p_buffer = NULL;

		//puts(buffer);
		
		char *out = buffer;
		for (; *out; out++) {
				_putc(*out);
		}
		return counter;
}
