## Install Flow cli

***macOS***

`brew install flow-cli`

***Linux***

`sh -ci “$(curl -fsSL https://storage.googleapis.com/flow-cli/install.sh)"`

***Windows***

`iex “& { $(irm ‘https://storage.googleapis.com/flow-cli/install.ps1') }”`

## Start Flow
***flow Terminal 1***

1. `flow project start-emulator`

***flow Terminal 2***

1. `flow project deploy`
2. `flow transactions send ./transactions/MintPinataParty.cdc --signer emulator-account`
3. `flow scripts execute ./scripts/CheckTokenMetadata.cdc`

***React Terminal***

1. `npm install`
2. `npm start`
