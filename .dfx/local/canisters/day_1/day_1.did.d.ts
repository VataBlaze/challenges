import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'add' : (arg_0: bigint, arg_1: bigint) => Promise<bigint>,
  'clear_counter' : () => Promise<string>,
  'days_to_second' : (arg_0: bigint) => Promise<bigint>,
  'divide' : (arg_0: bigint, arg_1: bigint) => Promise<boolean>,
  'dividebool' : (arg_0: bigint, arg_1: bigint) => Promise<boolean>,
  'dividetext' : (arg_0: bigint, arg_1: bigint) => Promise<string>,
  'increment_counter' : (arg_0: bigint) => Promise<bigint>,
  'is_even' : (arg_0: bigint) => Promise<boolean>,
  'square' : (arg_0: bigint) => Promise<bigint>,
  'sum_of_array' : () => Promise<bigint>,
}
