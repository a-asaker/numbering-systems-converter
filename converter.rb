#!/usr/bin/ruby
# encoding: utf-8

# Coded By : A_Asaker

require "os"

def to_dec_rat(num,base)
	conv_num=0
	n=0
	for x in num.split("")
		n=n+1
		if base==16
			x=10 if x=="a"
			x=11 if x=="b"
			x=12 if x=="c"
			x=13 if x=="d"
			x=14 if x=="e"
			x=15 if x=="f"
		end
		conv_num=conv_num+(x.to_i*(base**(-n)))
	end
	num=conv_num.to_f.to_s
	return num[num.index('.')+1,num.length-1]
end

def to_dec_nat(num,base)
	if base==16
		return num.hex
	else
		conv_num=0
		n=num.length
		for x in num.split("")
			n=n-1
			conv_num=conv_num+(x.to_i*(base**(n)))
		end
	end
		return conv_num
end

def frm_dec_nat(num,base)
	return num.to_i.to_s(base)
end

def frm_dec_rat(num,base)
	conv_num=""
	num=num.to_f
	if num != 0.0
		for i in (0..18)
			num = num.to_f*base
			conv,num=num.to_s.split(".")
			conv=conv.to_i.to_s(base) if base==16
			conv_num+=conv
			num="."+num
		end
		return conv_num
	else
		return 0
	end
end

def frm_dec(base)
	print("\n Enter The Decimal Number : ")
	num=gets.chomp
	if num.index(".") == nil
		return frm_dec_nat(num,base)
	elsif num.index(".") == 0
		num_nat=0
		num_rat=num[num.index("."),num.length-1]
		dec=num_nat.to_s+"."+frm_dec_rat(num_rat,base).to_s
		return dec
	else
		num_nat=num[0,num.index(".")]
		num_rat=num[num.index("."),num.length-1]
		dec=frm_dec_nat(num_nat,base).to_s+"."+frm_dec_rat(num_rat,base).to_s
		return dec
	end
end

def to_dec(base)
	num=""
	if base==2
		print("\n Enter The Binary Number : ")
		num=gets.chomp
	elsif base==8
		print("\n Enter The Octal Number : ")
		num=gets.chomp
	elsif base==16
		print("\n Enter The Hexa-Decimal Number : ")
		num=gets.chomp
	else
		return "Error!"
	end
	rat=num.index(".")
	if rat==nil
		return to_dec_nat(num,base)
	else
		return (to_dec_nat(num[0,rat],base).to_s+"."+to_dec_rat(num[rat+1,num.length-1],base)).to_s
	end
end

$str_res="   ---------------------------\n ==> | %s |\n   ---------------------------
______________________________________________________________________________
______________________________________________________________________________
"

def main
	puts("
 ┌────────────────────┐
 │  ＯＰＴＩＯＮＳ  ：│
 └────────────────────┘
		")
	puts(" (1) Decimal To Binary")
	puts(" (2) Binary To Decimal")
	puts(" (3) Decimal To Octal")
	puts(" (4) Octal To Decimal")
	puts(" (5) Decimal To Hexa-decimal")
	puts(" (6) Hexa-decimal To Decimal")
	puts(" (7) Clear The Terminal [c]")
	puts(" (0) Exit [q]","\n")
	print(" #=========# >( 1 || 2 || 3 || 4 || 5 || 6 || 7 || 0 ): ")
	x=gets.chomp
	if x == '1'
		puts($str_res % frm_dec(2))
	elsif x == '2'
		puts($str_res % to_dec(2))
	elsif x=='3'
		puts($str_res % frm_dec(8))
	elsif x=='4'
		puts($str_res % to_dec(8))
	elsif x=='5'
		puts($str_res % frm_dec(16))
	elsif x=='6'
		puts($str_res % to_dec(16))
	elsif x.to_s=="7" or x.to_s.downcase=='c'
		if OS.windows?
			puts `cls`
		else 
			puts `clear`
		end
	elsif x.to_s.downcase=='0' or x.downcase=="q"
		puts("
		┌──────────────────────────────────────┐
		│Ｃｏｄｅｄ  Ｂｙ  ：  Ａ＿Ａｓａｋｅｒ│
		└──────────────────────────────────────┘

			")
		exit
	else
		puts("\n Go Play Far Away ! \n")
		exit
	end
end

while true
	main
end
