----------------------------------------------------------------------------------
-- *  test1.vhd - some HDL acknoledge test realization 
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
use IEEE.std_logic_unsigned.all;

entity test1 is
    Port ( clk1 : in STD_LOGIC;
           clk2 : in STD_LOGIC;
           A : in STD_LOGIC;
           value : out STD_LOGIC_VECTOR (11 downto 0);
           valid : out STD_LOGIC);
end test1;

architecture test1_ea of test1 is
constant OUT_PERIOD: integer range 0 to 999:= 1000-1; 

signal Valid_reg: STD_LOGIC_VECTOR (1 downto 0):=(others=>'0'); 

signal Value_clk1: STD_LOGIC_VECTOR (11 downto 0):=(others=>'0'); 
signal Value_clk2: STD_LOGIC_VECTOR (11 downto 0):=(others=>'0'); 
signal Valid_src : STD_LOGIC:='0';
signal A_reg : STD_LOGIC:='0';

begin

clk1_proc: process (clk1)
begin
    if rising_edge(clk1) then
        A_reg <= A;
        Valid_reg <= Valid_reg(0) &  Valid_src;
        if Valid_reg(1) = '0' and Valid_reg(0) = '1' then
            if (A = '1' and A_reg='0') then
                Value_clk1 <= (0=>'1', others=> '0');
            elsif (A = '1' and A_reg='1') then
                Value_clk1 <= (1=>'1', others=> '0');
            elsif (A = '0' and A_reg='1') then
                Value_clk1 <= (0=>'1', others=> '0');
            else    
                Value_clk1 <= (others=> '0');
            end if;
        else     
            if (A = '1') then
                Value_clk1 <= Value_clk1 + '1';
            end if;
        end if;        
    end if; 
end process;

clk2_proc: process (clk2)
variable out_cnt: integer range 0 to 999:=0;
begin
    if rising_edge(clk2) then
        Valid_src <= '0';
        Value_clk2 <= Value_clk1;            
        --
        if out_cnt<OUT_PERIOD then
            out_cnt := out_cnt + 1;
        else 
            out_cnt := 0; 
            Valid_src <= '1';
        end if;
    end if; 
end process;

Valid <= Valid_src;
Value <= Value_clk2;            

end test1_ea;
