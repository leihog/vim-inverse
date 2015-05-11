# vim-inverse

A simple plugin to inverse words such that true becomes false, 1 becomes 0 etc.

## Installation

### Install with [pathogen](https://github.com/tpope/vim-pathogen)

      git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript

## Configuration

The following variables controls which words Inverse will handle.

### g:inverse_targets

By default Inverse will handle
true/false, 1/0, on/off, enabled/disabled, and yes/no.

You may add additional targets by adding them to the variable g:inverse_targets
The expected format is a dictionary where the key is a target and the value it's
replacement. The inverse of a pair will be added automatically.

    g:inverse_targets = {'true': 'false'}

### g:inverse_allow_overwrite

By default targets can't be overwritten. But setting this variable to anything
that will evaluate to true changes this behavior.

    g:inverse_allow_overwrite = 1
    g:inverse_targets = {1: -1} " changes the default 0 to -1

### g:inverse_swap_isk

Inverse depends on the vim option iskeyword for matching it's targets.
By default Inverse will change the value of iskeyword while it's running.
You may disable this behavior by setting g:inverse_swap_isk to 0.

Default Value: 1

## Commands

Inverse adds two new commands

### Inverse

This command handles the actual inversion,
just place the cursor over a target and call Inverse.

To make things easier I recommend that you map it to <leader>i
`map <leader>i :Inverse<CR>`

### InverseSetup

if you alter the configuration variables during a vim session
call InverseSetup to activate the changes made.

## Additional notes

I'm in no way a vim expert so this functionality might already exist in the
form of another plugin or even as a vim feature.

This is my first vim plugin, so be gentle. :)
