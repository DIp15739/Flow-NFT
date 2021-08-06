import PinataPartyContract from 0xf8d6e0586b0a20c7

transaction {
  let receiverRef: &{PinataPartyContract.NFTReceiver}
  let minterRef: &PinataPartyContract.NFTMinter

  prepare(acct: AuthAccount) {
      self.receiverRef = acct.getCapability<&{PinataPartyContract.NFTReceiver}>(/public/NFTReceiver)
          .borrow()
          ?? panic("Could not borrow receiver reference")        
      
      self.minterRef = acct.borrow<&PinataPartyContract.NFTMinter>(from: /storage/NFTMinter)
          ?? panic("could not borrow minter reference")
  }

  execute {
      let metadata : {String : String} = {
          "name": "Flow Big Swing",
          "swing_velocity": "30", 
          "swing_angle": "50", 
          "rating": "7",
          "uri": "ipfs://QmfATQNSR2sbFAQwfgycZyzXqYcAT4TXPSeyyMTjekaUR9"
      }
      let newNFT <- self.minterRef.mintNFT()
  
      self.receiverRef.deposit(token: <-newNFT, metadata: metadata)

      log("NFT Minted and deposited to Account Collection")
  }
}