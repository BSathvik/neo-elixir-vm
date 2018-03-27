defmodule OpCode do
  #  constants
 @all_att %{
   :push0 => "\x00",  # an empty array of bytes is pushed onto the stack.
   :pushf => "\x00", #NOTE
   :pushbytes1 => "\x01",  # b"\x01-b"\x4b the next opcode bytes is data to be pushed onto the stack.
   :pushbytes2 => "\x02",
   :pushbytes3 => "\x03",
   :pushbytes4 => "\x04",
   :pushbytes5 => "\x05",
   :pushbytes6 => "\x06",
   :pushbytes7 => "\x07",
   :pushbytes8 => "\x08",
   :pushbytes9 => "\x09",
   :pushbytes10 => "\x0a",
   :pushbytes11 => "\x0b",
   :pushbytes12 => "\x0c",
   :pushbytes13 => "\x0d",
   :pushbytes14 => "\x0e",
   :pushbytes15 => "\x0f",
   :pushbytes16 => "\x10",
   :pushbytes17 => "\x11",
   :pushbytes18 => "\x12",
   :pushbytes19 => "\x13",
   :pushbytes20 => "\x14",
   :pushbytes21 => "\x15",
   :pushbytes22 => "\x16",
   :pushbytes23 => "\x17",
   :pushbytes24 => "\x18",
   :pushbytes25 => "\x19",
   :pushbytes26 => "\x1a",
   :pushbytes27 => "\x1b",
   :pushbytes28 => "\x1c",
   :pushbytes29 => "\x1d",
   :pushbytes30 => "\x1e",
   :pushbytes31 => "\x1f",
   :pushbytes32 => "\x20",
   :pushbytes33 => "\x21",
   :pushbytes34 => "\x22",
   :pushbytes35 => "\x23",
   :pushbytes36 => "\x24",
   :pushbytes37 => "\x25",
   :pushbytes38 => "\x26",
   :pushbytes39 => "\x27",
   :pushbytes40 => "\x28",
   :pushbytes41 => "\x29",
   :pushbytes42 => "\x2a",
   :pushbytes43 => "\x2b",
   :pushbytes44 => "\x2c",
   :pushbytes45 => "\x2d",
   :pushbytes46 => "\x2e",
   :pushbytes47 => "\x2f",
   :pushbytes48 => "\x30",
   :pushbytes49 => "\x31",
   :pushbytes50 => "\x32",
   :pushbytes51 => "\x33",
   :pushbytes52 => "\x34",
   :pushbytes53 => "\x35",
   :pushbytes54 => "\x36",
   :pushbytes55 => "\x37",
   :pushbytes56 => "\x38",
   :pushbytes57 => "\x39",
   :pushbytes58 => "\x3a",
   :pushbytes59 => "\x3b",
   :pushbytes60 => "\x3c",
   :pushbytes61 => "\x3d",
   :pushbytes62 => "\x3e",
   :pushbytes63 => "\x3f",
   :pushbytes64 => "\x40",
   :pushbytes65 => "\x41",
   :pushbytes66 => "\x42",
   :pushbytes67 => "\x43",
   :pushbytes68 => "\x44",
   :pushbytes69 => "\x45",
   :pushbytes70 => "\x46",
   :pushbytes71 => "\x47",
   :pushbytes72 => "\x48",
   :pushbytes73 => "\x49",
   :pushbytes74 => "\x4a",
   :pushbytes75 => "\x4b",
   :pushdata1 => "\x4c",  # the next byte contains the number of bytes to be pushed onto the stack.
   :pushdata2 => "\x4d",  # the next two bytes contain the number of bytes to be pushed onto the stack.
   :pushdata4 => "\x4e",  # the next four bytes contain the number of bytes to be pushed onto the stack.
   :pushm1 => "\x4f",  # the number -1 is pushed onto the stack.
   :push1 => "\x51",  # the number 1 is pushed onto the stack.
   :pusht => "\x51", #NOTE
   :push2 => "\x52",  # the number 2 is pushed onto the stack.
   :push3 => "\x53",  # the number 3 is pushed onto the stack.
   :push4 => "\x54",  # the number 4 is pushed onto the stack.
   :push5 => "\x55",  # the number 5 is pushed onto the stack.
   :push6 => "\x56",  # the number 6 is pushed onto the stack.
   :push7 => "\x57",  # the number 7 is pushed onto the stack.
   :push8 => "\x58",  # the number 8 is pushed onto the stack.
   :push9 => "\x59",  # the number 9 is pushed onto the stack.
   :push10 => "\x5a",  # the number 10 is pushed onto the stack.
   :push11 => "\x5b",  # the number 11 is pushed onto the stack.
   :push12 => "\x5c",  # the number 12 is pushed onto the stack.
   :push13 => "\x5d",  # the number 13 is pushed onto the stack.
   :push14 => "\x5e",  # the number 14 is pushed onto the stack.
   :push15 => "\x5f",  # the number 15 is pushed onto the stack.
   :push16 => "\x60",  # the number 16 is pushed onto the stack.


    #  flow control,
   :nop => "\x61",  # does nothing.
   :jmp => "\x62",
   :jmpif => "\x63",
   :jmpifnot => "\x64",
   :call => "\x65",
   :ret => "\x66",
   :appcall => "\x67",
   :syscall => "\x68",
   :tailcall => "\x69",


    # exceptions,
   :throw => "\xf0",
   :throwifnot => "\xf1",


    #  stack,
   :dupfromaltstack => "\x6a",
   :toaltstack => "\x6b",  # puts the input onto the top of the alt stack. removes it from the main stack.
   :fromaltstack => "\x6c",  # puts the input onto the top of the main stack. removes it from the alt stack.
   :xdrop => "\x6d",
   :xswap => "\x72",
   :xtuck => "\x73",
   :depth => "\x74",  # puts the number of stack items onto the stack.
   :drop => "\x75",  # removes the top stack item.
   :dup => "\x76",  # duplicates the top stack item.
   :nip => "\x77",  # removes the second-to-top stack item.
   :over => "\x78",  # copies the second-to-top stack item to the top.
   :pick => "\x79",  # the item n back in the stack is copied to the top.
   :roll => "\x7a",  # the item n back in the stack is moved to the top.
   :rot => "\x7b",  # the top three items on the stack are rotated to the left.
   :swap => "\x7c",  # the top two items on the stack are swapped.
   :tuck => "\x7d",  # the item at the top of the stack is copied and inserted before the second-to-top item.


    #  splice,
   :cat => "\x7e",  # concatenates two strings.,
   :substr => "\x7f",  # returns a section of a string.,
   :left => "\x80",  # keeps only characters left of the specified point in a string.,
   :right => "\x81",  # keeps only characters right of the specified point in a string.,
   :size => "\x82",  # returns the length of the input string.,


    #  bitwise logic,
   :invert => "\x83",  # flips all of the bits in the input.
   :and_ => "\x84",  # boolean and between each bit in the inputs. #NOTE: and is reserved so => "and_"
   :or_ => "\x85",  # boolean or between each bit in the inputs. #NOTE: or is reserved so => "or_",
   :xor => "\x86",  # boolean exclusive or between each bit in the inputs.
   :equal => "\x87",  # returns 1 if the inputs are exactly equal" 0 otherwise.
    # op_equalverify => "\x88" #  same as op_equal" but runs op_verify afterward.
    # op_reserved1 => "\x89" #  transaction is invalid unless occuring in an unexecuted op_if branch
    # op_reserved2 => "\x8a" #  transaction is invalid unless occuring in an unexecuted op_if branch

    #  arithmetic,
    #  note: arithmetic inputs are limited to signed 32-bit integers" but may overflow their output.
   :inc => "\x8b",  # 1 is added to the input.
   :dec => "\x8c",  # 1 is subtracted from the input.
   :sign => "\x8d",
   :negate => "\x8f",  # the sign of the input is flipped.
   :abs => "\x90",  # the input is made positive.,
   :not => "\x91",  # if the input is 0 or 1" it is flipped. otherwise the output will be 0.
   :nz => "\x92",  # returns 0 if the input is 0. 1 otherwise.
   :add => "\x93",  # a is added to b.
   :sub => "\x94",  # b is subtracted from a.
   :mul => "\x95",  # a is multiplied by b.
   :div => "\x96",  # a is divided by b.
   :mod => "\x97",  # returns the remainder after dividing a by b.
   :shl => "\x98",  # shifts a left b bits" preserving sign.
   :shr => "\x99",  # shifts a right b bits" preserving sign.
   :booland => "\x9a",  # if both a and b are not 0" the output is 1. otherwise 0.
   :boolor => "\x9b",  # if a or b is not 0" the output is 1. otherwise 0.
   :numequal => "\x9c",  # returns 1 if the numbers are equal" 0 otherwise.
   :numnotequal => "\x9e",  # returns 1 if the numbers are not equal" 0 otherwise.
   :lt => "\x9f",  # returns 1 if a is less than b" 0 otherwise.
   :gt => "\xa0",  # returns 1 if a is greater than b" 0 otherwise.
   :lte => "\xa1",  # returns 1 if a is less than or equal to b" 0 otherwise.
   :gte => "\xa2",  # returns 1 if a is greater than or equal to b" 0 otherwise.
   :min => "\xa3",  # returns the smaller of a and b.
   :max => "\xa4",  # returns the larger of a and b.
   :within => "\xa5",  # returns 1 if x is within the specified range (left-inclusive)" 0 otherwise.

    #  Crypto
    # ripemd160 => "\xa6" #  the input is hashed using ripemd-160.
   :sha1 => "\xa7",  # the input is hashed using SHA-1
   :sha256 => "\xa8",  # the input is hashed using SHA-256.
   :hash160 => "\xa9",
   :hash256 => "\xaa",
   :checksig => "\xac",
   :checkmultisig => "\xae",


    #  Array,
   :arraysize => "\xc0",
   :pack => "\xc1",
   :unpack => "\xc2",
   :pickitem => "\xc3",
   :setitem => "\xc4",
   :newarray => "\xc5",  # 用作引用類型
   :newstruct => "\xc6",  # 用作值類型
   :append => "\xc8",
   :reverse => "\xc9",
   :remove => "\xca",

   :debug => "\xcd"

  }

  def get_opcode(op) do
    @all_att[op]
  end

end
