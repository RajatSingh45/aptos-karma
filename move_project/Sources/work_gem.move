module company::WorkGem {
    use std::vector;
    use std::signer;
    use std::string;

    /// WorkGem struct = proof of work
    struct WorkGem has key, store {
        id: u64,
        worker: address,
        company: address,
        rating: u8,
        category: string::String,
        timestamp: u64,
        xp_earned: u64, // XP earned from this job
    }

    /// Table of WorkGems (id → WorkGem)
    struct WorkGemStore has key {
        next_id: u64,
        gems: vector<WorkGem>,
    }

    /// Add XP calculation based on rating
    const XP_PER_RATING: u64 = 10;

    /// Initialize the store (called once by module publisher)
    public entry fun init_store(account: &signer) {
        move_to(account, WorkGemStore {
            next_id: 0,
            gems: vector::empty<WorkGem>(),
        });
    }

    /// Company creates a new WorkGem for a worker
    public entry fun create_work_gem(
        company: &signer,
        worker: address,
        rating: u8,
        category: string::String,
        timestamp: u64
    ) acquires WorkGemStore {
        let company_addr = signer::address_of(company);
        let store = borrow_global_mut<WorkGemStore>(company_addr);
        
        let xp_earned = (rating as u64) * XP_PER_RATING;
        
        let new_gem = WorkGem {
            id: store.next_id,
            worker: worker,
            company: company_addr,
            rating: rating,
            category: category,
            timestamp: timestamp,
            xp_earned: xp_earned,
        };

        vector::push_back(&mut store.gems, new_gem);
        store.next_id = store.next_id + 1;
    }

    /// Helper function to get XP earned (optional)
    public fun get_xp_earned(gem: &WorkGem): u64 {
        gem.xp_earned
    }
}
