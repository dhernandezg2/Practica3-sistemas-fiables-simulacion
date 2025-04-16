library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_redundancia is
end tb_redundancia;

architecture Behavioral of tb_redundancia is

    -- Señales de prueba
    signal CLK100MHZ      : STD_LOGIC := '0';
    signal RESET          : STD_LOGIC := '1';
    signal SW             : STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal LED            : STD_LOGIC_VECTOR(7 downto 0);
    signal LED_CONTADOR_1: STD_LOGIC;
    signal LED_CONTADOR_2: STD_LOGIC;
    signal AN             : STD_LOGIC_VECTOR(7 downto 0);
    signal SEG            : STD_LOGIC_VECTOR(6 downto 0);

    constant CLK_PERIOD : time := 10 ns;

    component redundancia
        generic ( SIMULATION_MODE : boolean := true );
        port (
            CLK100MHZ       : in  STD_LOGIC;
            RESET           : in  STD_LOGIC;
            SW              : in  STD_LOGIC_VECTOR(0 downto 0);
            LED             : out STD_LOGIC_VECTOR(7 downto 0);
            LED_CONTADOR_1  : out STD_LOGIC;
            LED_CONTADOR_2  : out STD_LOGIC;
            AN              : out STD_LOGIC_VECTOR(7 downto 0);
            SEG             : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

begin

    -- Instanciar el DUT
    DUT: redundancia
        generic map ( SIMULATION_MODE => true )
        port map (
            CLK100MHZ      => CLK100MHZ,
            RESET          => RESET,
            SW             => SW,
            LED            => LED,
            LED_CONTADOR_1 => LED_CONTADOR_1,
            LED_CONTADOR_2 => LED_CONTADOR_2,
            AN             => AN,
            SEG            => SEG
        );

    -- Generación de reloj
    clk_process : process
    begin
        while true loop
            CLK100MHZ <= '0';
            wait for CLK_PERIOD / 2;
            CLK100MHZ <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    testeo: process
    begin
        -- RESET activado
        wait for 50 ns;
        RESET <= '1';

        wait for 300 ns;

        -- Cambiar al contador 2
        SW <= "1";
        wait for 300 ns;

        -- Volver al contador 1
        SW <= "0";
        wait for 300 ns;
        wait;
    end process;
end Behavioral;
