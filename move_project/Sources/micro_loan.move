module company::micro_loab {
    use std::signer;
    use std::coin;
    use aptos_framework::aptos_coin::{AptosCoin};


    
    /// Error codes
    const E_INSUFFICIENT_KARMA: u64 = 1;
    const E_INSUFFICIENT_FUNDS: u64 = 2;
    const E_POOL_NOT_FOUND: u64 = 3;
    const E_NOT_AUTHORIZED: u64 = 4;

    /// Loan pool = holds AptosCoins for lending
    struct LoanPool has key {
        coins: coin::Coin<AptosCoin>,
        min_karma: u64,
    }

    /// Initialize loan pool at the module publisher's account
    public entry fun init_pool(publisher: &signer, amount: u64, min_karma: u64) {
        // Withdraw AptosCoins from publisher
        let coins = coin::withdraw<AptosCoin>(publisher, amount);
        // Store the pool at publisher's address
        move_to(publisher, LoanPool { coins,min_karma });
    }

    /// Request a loan from the global pool
    public entry fun request_loan(
        worker: &signer,       // signer requesting loan
        pool_owner: address,   // signer who owns the pool (usually module publisher)
        karma_score: u64,
        amount: u64
    ) acquires LoanPool {

        assert!(exists<LoanPool>(pool_owner), E_POOL_NOT_FOUND);
        let pool = borrow_global_mut<LoanPool>(pool_owner);

        if (karma_score < pool.min_karma) abort E_INSUFFICIENT_KARMA;
        if (coin::value(&pool.coins) < amount) abort E_INSUFFICIENT_FUNDS;

        let loan_coins = coin::extract(&mut pool.coins, amount);
        coin::deposit<AptosCoin>(signer::address_of(worker), loan_coins);

    }

   // Check pool balance
    // public fun get_pool_balance(pool_owner: address): u64 acquires LoanPool {
    //     if (!exists<LoanPool>(pool_owner)) {
    //         abort E_POOL_NOT_FOUND;
    //     };
    //     let pool = borrow_global<LoanPool>(pool_owner);
    //     coin::value(&pool.coins)
    // }
}
