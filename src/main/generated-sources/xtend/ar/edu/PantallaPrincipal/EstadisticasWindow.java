package ar.edu.PantallaPrincipal;

import ar.edu.main.Estadisticas;
import java.awt.Color;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class EstadisticasWindow extends MainWindow<Estadisticas> {
  public EstadisticasWindow() {
    super(new Estadisticas());
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Event OS");
    Label _label = new Label(mainPanel);
    _label.setText("Estadisticas");
    Label _label_1 = new Label(mainPanel);
    final Procedure1<Label> _function = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setBackground(Color.GREEN);
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "cantidadTotalEventosOrganizados");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function);
  }
  
  public static void main(final String[] args) {
    new EstadisticasWindow().startApplication();
  }
}
