# Autocompletion function using locals - to monkey-patch Pdb.
#import rlcompleter

def complete(self, text, state):
    if not hasattr(self, 'completer'):
        self.completer = rlcompleter.Completer(self.curframe.f_locals)
    else:
        self.completer.namespace = self.curframe.f_locals
    return self.completer.complete(text, state)
