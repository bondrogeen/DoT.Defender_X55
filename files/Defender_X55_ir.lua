local a,b,c,d=0,"",true;if adc.force_init_mode(adc.INIT_ADC)then node.restart()end;local function e(f,g)d=g-a;a=g;if d>13000 and d<16000 then b=""c=true end;if d>1000 and d<1500 then b=b..0 end;if d>2000 and d<2500 then b=b..1 end;if b:len()==32 and c then dofile("Defender_X55_comm.lua")(b:sub(17,24))c=false end;if d>90000 and d<100000 then if b:len()==32 then dofile("Defender_X55_comm.lua")(b:sub(17,24))else print("error")end end end;local function h(i,j)local k,l=0,200000;return function(m,n,o)local p=tmr.now()if p-k<l then return end;k=p;return i(j)end end;local function q(r)if gpio.read(r)==0 then local s=adc.read(0)if s>0 and s<50 then x="11011000"end;if s>400 and s<450 then x="11001000"end;if s>550 and s<600 then x="11101000"end;if s>650 and s<700 then x="00011010"end;if s>700 and s<800 then x="10011010"end;dofile("Defender_X55_comm.lua")(x or"0")end end;gpio.mode(2,gpio.INT)gpio.trig(2,'low',h(q,2))gpio.mode(1,gpio.INT)gpio.trig(1,"down",e)
