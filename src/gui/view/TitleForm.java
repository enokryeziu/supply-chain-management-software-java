/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui.view;


import BLL.Title;
import DAL.SCHMException;
import DAL.TitleRepository;
import gui.model.TitleTableModel;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import DAL.TitleInterface;
import java.beans.PropertyVetoException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
/**
 *
 * @author EN
 */
public class TitleForm extends javax.swing.JInternalFrame {

    /**
     * Creates new form EmployeeForm
     */
    TitleInterface cir = new TitleRepository();
    TitleTableModel ctm = new TitleTableModel();
    public TitleForm(){
        initComponents();
        loadTable();
        tabelaSelectedIndexChange();
    }
    
    private void tabelaSelectedIndexChange() {
        final ListSelectionModel rowSM = tabela.getSelectionModel();
        rowSM.addListSelectionListener(new ListSelectionListener() {

            public void valueChanged(ListSelectionEvent Ise) {
                if (Ise.getValueIsAdjusting()) {
                    return;
                }
                ListSelectionModel rowSM = (ListSelectionModel) Ise.getSource();
                int selectedIndex = rowSM.getAnchorSelectionIndex();
                if (selectedIndex > -1) {
                    Title c = ctm.getTitle(selectedIndex);
                    titleTF.setText(c.getTitleName());
                   
                    
                }
            }
        });
    }
    
    public void loadTable() {
        try {
            List<Title> list = cir.findAll();
            ctm.add(list);
            tabela.setModel(ctm);
            ctm.fireTableDataChanged();
        } catch (SCHMException e) {
            JOptionPane.showMessageDialog(this, e.getMessage());
        }

    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        titleTF = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tabela = new javax.swing.JTable();
        saveBtn = new javax.swing.JButton();
        deleteBtn = new javax.swing.JButton();
        cancelBtn = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        descriptionTF = new javax.swing.JTextField();

        setClosable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("Title");

        jLabel1.setText("Titulli :");

        titleTF.setMinimumSize(new java.awt.Dimension(6, 19));
        titleTF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                titleTFActionPerformed(evt);
            }
        });

        tabela.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        tabela.getTableHeader().setReorderingAllowed(false);
        jScrollPane1.setViewportView(tabela);

        saveBtn.setText("Save");
        saveBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                saveBtnActionPerformed(evt);
            }
        });

        deleteBtn.setText("Delete");
        deleteBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                deleteBtnActionPerformed(evt);
            }
        });

        cancelBtn.setText("Clear");
        cancelBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelBtnActionPerformed(evt);
            }
        });

        jLabel2.setText("Pershkrimi :");

        descriptionTF.setMinimumSize(new java.awt.Dimension(6, 19));
        descriptionTF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                descriptionTFActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 617, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(saveBtn)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(deleteBtn)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cancelBtn)))
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(titleTF, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(descriptionTF, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel2)
                        .addComponent(descriptionTF, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel1)
                        .addComponent(titleTF, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(47, 47, 47)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 371, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(saveBtn)
                    .addComponent(deleteBtn)
                    .addComponent(cancelBtn))
                .addGap(18, 18, 18))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void titleTFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_titleTFActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_titleTFActionPerformed

    private void saveBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_saveBtnActionPerformed
        if (!titleTF.getText().trim().equals("") && !descriptionTF.getText().trim().equals("")) {
            int row = tabela.getSelectedRow();
            if (row == -1) {
                Title c = new Title();
                c.setTitleName(titleTF.getText());
                c.setDescription(descriptionTF.getText());
                
                try {
                    cir.create(c);
                } catch (SCHMException es) {
                    JOptionPane.showMessageDialog(this, es.getMessage());
                    return;
                }
            } else {
                Title c = ctm.getTitle(row);
                c.setTitleName(titleTF.getText());
                                c.setDescription(descriptionTF.getText());

               
                try {
                    cir.edit(c);
                } catch (SCHMException es) {
                    JOptionPane.showMessageDialog(this, es.getMessage());
                    return;
                }
                
            }
            clearFild();
            loadTable();

        } else {
            JOptionPane.showMessageDialog(this, "Ju lutem plotesoni te gjitha fushat obligative!");
        }
    }//GEN-LAST:event_saveBtnActionPerformed

    private void cancelBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelBtnActionPerformed
        clearFild();
    }//GEN-LAST:event_cancelBtnActionPerformed

    private void deleteBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_deleteBtnActionPerformed
        int row = tabela.getSelectedRow();
        if (row > -1) {
            Object[] ob = {"Po", "Jo"};
            int i = JOptionPane.showOptionDialog(this, "A dëshironi ta fshini ?", "Fshirja", JOptionPane.OK_OPTION, JOptionPane.QUESTION_MESSAGE, null, ob, ob[1]);
            if (i == 0) {
                Title c = ctm.getTitle(row);
                try {
                    cir.delete(c);
                } catch (SCHMException es) {
                    JOptionPane.showMessageDialog(this, es.getMessage());
                }
                clearFild();
                loadTable();
            } else {
                clearFild();
            }

        } else {
            JOptionPane.showMessageDialog(this, "Nuk keni selektuar asgje per te fshire!");

        }
    }//GEN-LAST:event_deleteBtnActionPerformed

    private void descriptionTFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_descriptionTFActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_descriptionTFActionPerformed
    public void clearFild() {
        tabela.clearSelection();
        titleTF.setText("");
        descriptionTF.setText("");
        
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cancelBtn;
    private javax.swing.JButton deleteBtn;
    private javax.swing.JTextField descriptionTF;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton saveBtn;
    private javax.swing.JTable tabela;
    private javax.swing.JTextField titleTF;
    // End of variables declaration//GEN-END:variables
}
