----------------------------------------------------------------------------------
-- *  test1_tb.vhd - some HDL acknoledge test realization tesbench 
-- *
-- *  Copyright (C) 2023, Sergey Victorovich <sch496@mail.ru>
-- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- *  This program is free software; you can redistribute it and/or modify
-- *  it under the terms of the GNU General Public License as published by
-- *  the Free Software Foundation; either version 2 of the License, or (at
-- *  your option) any later version.
-- *
-- *  This program is distributed in the hope that it will be useful, but
-- *  WITHOUT ANY WARRANTY; without even the implied warranty of
-- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- *  General Public License for more details.
-- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test1_tb is
end test1_tb;

architecture tb of test1_tb is
component test1 is
    Port ( clk1 : in STD_LOGIC;
           clk2 : in STD_LOGIC;
           A : in STD_LOGIC;
           value : out STD_LOGIC_VECTOR (11 downto 0);
           valid : out STD_LOGIC);
end component test1;
signal CLK_1: STD_LOGIC:='0';
signal CLK_2: STD_LOGIC:='0';
signal A:     STD_LOGIC:='0';
signal Value : STD_LOGIC_VECTOR (11 downto 0):=(others=>'0');
signal Valid : STD_LOGIC:='0';

constant PERIOD1 : time:= 3610 ps; --227MHz
constant PERIOD2 : time:= 9709 ps; --103MHz
signal   PERIODA : time:= 33 ns ;  --some initial period of input signal

begin
CLK_1 <= not CLK_1 after PERIOD1/2;
CLK_2 <= not CLK_2 after PERIOD2/2;

A <= not A after PERIODA/2;
PERIODA <= PERIODA + 1ns after 100 ns; 


uut: test1 port map (
           clk1 => CLK_1,   --: in STD_LOGIC;
           clk2 => CLK_2,   --: in STD_LOGIC;
           A    => A,       --: in STD_LOGIC;
           value => Value,  --: out STD_LOGIC_VECTOR (11 downto 0);
           valid => Valid); --: out STD_LOGIC);


end tb;
