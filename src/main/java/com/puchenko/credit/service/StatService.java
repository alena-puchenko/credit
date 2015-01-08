package com.puchenko.credit.service;

import com.puchenko.credit.model.Stat;
import java.util.List;

public interface StatService {
    
    void createStat(Stat stat);

    Stat readTask(int statId);

    void updateStat(Stat stat);

    void deleteStat(Stat stat);

    List getAllStats();
    
}
