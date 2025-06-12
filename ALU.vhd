-- ============================================================================
--  ALU.vhd
--  Author      : Ananya Vaidya
--  Description : 8-bit Arithmetic Logic Unit (ALU)
--                Performs basic arithmetic and logical operations based on a
--                3-bit control signal.
-- ============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- ============================================================================
--  Entity Declaration
--  Inputs  :
--    inp_a   : First signed operand (8-bit)
--    inp_b   : Second signed operand (8-bit)
--    sel     : 3-bit selector signal to choose operation
--  Outputs :
--    out_alu : ALU output (8-bit signed result)
-- ============================================================================
entity alu is
  Port (
    inp_a   : in signed(7 downto 0);
    inp_b   : in signed(7 downto 0);
    sel     : in STD_LOGIC_VECTOR (2 downto 0);
    out_alu : out signed(7 downto 0)
  );
end alu;

-- ============================================================================
--  Architecture Definition
--  Implements ALU behavior using a case statement based on the 'sel' input.
-- ============================================================================
architecture Behavioral of alu is
begin

  process(inp_a, inp_b, sel)
  begin
    case sel is
      when "000" =>
        out_alu <= inp_a + inp_b;        -- Addition: A + B
      when "001" =>
        out_alu <= inp_a - inp_b;        -- Subtraction: A - B
      when "010" =>
        out_alu <= inp_a - 1;            -- Decrement A: A - 1
      when "011" =>
        out_alu <= inp_a + 1;            -- Increment A: A + 1
      when "100" =>
        out_alu <= inp_a and inp_b;      -- Bitwise AND: A AND B
      when "101" =>
        out_alu <= inp_a or inp_b;       -- Bitwise OR: A OR B
      when "110" =>
        out_alu <= not inp_a;            -- Bitwise NOT: NOT A
      when "111" =>
        out_alu <= inp_a xor inp_b;      -- Bitwise XOR: A XOR B
      when others =>
        out_alu <= (others => '0');      -- Default: Output zero
    end case;
  end process;

end Behavioral;
