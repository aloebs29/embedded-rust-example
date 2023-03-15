#![no_std]
#![no_main]

use panic_halt as _;

use cortex_m_rt::entry;
use cortex_m_semihosting::{debug, hprintln};

fn reverse<'a>(pair: (&'a str, &'a str)) -> (&'a str, &'a str) {
    let (param1, param2) = pair;
    (param2, param1)
}

#[entry]
fn main() -> ! {
    let world_hello = ("world", "hello");
    let (hello, world) = reverse(world_hello);

    hprintln!("{}, {}!", hello, world).unwrap();
    debug::exit(debug::EXIT_SUCCESS);

    loop {}
}
