-- ============================================================================
--  Tb_alu.vhd
--  Description : Testbench for 8-bit signed ALU
-- ============================================================================
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- Testbench entity with no ports
ENTITY Tb_alu IS
END Tb_alu;

ARCHITECTURE behavior OF Tb_alu IS

  -- Component Declaration for the Unit Under Test (UUT)
  COMPONENT alu
    PORT(
      inp_a   : IN signed(7 downto 0);             -- First operand
      inp_b   : IN signed(7 downto 0);             -- Second operand
      sel     : IN std_logic_vector(2 downto 0);   -- ALU operation select
      out_alu : OUT signed(7 downto 0)             -- ALU result
    );
  END COMPONENT;

  -- Signals for driving inputs and receiving outputs
  signal inp_a : signed(7 downto 0) := (others => '0');
  signal inp_b : signed(7 downto 0) := (others => '0');
  signal sel   : std_logic_vector(2 downto 0) := (others => '0');
  signal out_alu : signed(7 downto 0);

BEGIN

  -- Instantiate the Unit Under Test (UUT)
  uut: alu PORT MAP (
    inp_a   => inp_a,
    inp_b   => inp_b,
    sel     => sel,
    out_alu => out_alu
  );

  -- Stimulus process to apply test vectors
  stim_proc: process
  begin
    wait for 100 ns;

    -- Apply test values
    inp_a <= "00001001";              -- A = 9
    inp_b <= "11111111";              -- B = -1 (two's complement)

    sel <= "000";                     -- ADD: A + B
    wait for 100 ns;

    sel <= "001";                     -- SUB: A - B
    wait for 100 ns;

    sel <= "010";                     -- DEC A: A - 1
    wait for 100 ns;

    sel <= "011";                     -- INC A: A + 1
    wait for 100 ns;

    sel <= "100";                     -- AND: A AND B
    wait for 100 ns;

    sel <= "101";                     -- OR: A OR B
    wait for 100 ns;

    sel <= "110";                     -- NOT A: NOT A
    wait for 100 ns;

    sel <= "111";                     -- XOR: A XOR B
    wait;

  end process;

END;