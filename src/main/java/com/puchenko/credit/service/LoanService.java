package com.puchenko.credit.service;

import com.puchenko.credit.model.Loan;
import java.util.List;

public interface LoanService {
    
    void createLoan(Loan loan);

    Loan readLoan(int loanId);

    void updateLoan(Loan loan);

    void deleteLoan(Loan loan);

    List getAllLoans();
    
    Loan getLoanByName(String name);
}
