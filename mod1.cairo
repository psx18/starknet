#[starknet::interface]
trait ISimpleStorage<TContractState> {
    fn sset(ref self: TContractState, x: u128);
    fn gget(self: @TContractState) -> u128;
}

#[starknet::contract]
mod SimpleStorage {
    use starknet::get_caller_address;
    use starknet::ContractAddress;

    #[storage]
    struct Storage {
        stored_data: u128
    }

    #[external(v0)]
    impl SimpleStorage of super::ISimpleStorage<ContractState> {
        fn sset(ref self: ContractState, x: u128) {
            self.stored_data.write(x);
        }
        fn gget(self: @ContractState) -> u128 {
            self.stored_data.read()
        }
    }
}
