import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure ThermalPackage where
  thermalConductivity : Type u
  specificHeat : Type v
  thermalExpansion : Prop
  heatTransferEquation : Prop
  phaseChangeEnthalpy : Prop
  thermalStability : Prop

structure ThermalEvidence (T : ThermalPackage) where
  thermalExpansionClosed : T.thermalExpansion
  heatTransferEquationClosed : T.heatTransferEquation
  phaseChangeEnthalpyClosed : T.phaseChangeEnthalpy
  thermalStabilityClosed : T.thermalStability

def ThermalClosed (T : ThermalPackage) : Prop :=
  T.thermalExpansion ∧ T.heatTransferEquation ∧ T.phaseChangeEnthalpy ∧ T.thermalStability

theorem thermal_closed_from_evidence (T : ThermalPackage) (E : ThermalEvidence T) :
  ThermalClosed T := by
  exact And.intro E.thermalExpansionClosed (And.intro E.heatTransferEquationClosed (And.intro E.phaseChangeEnthalpyClosed E.thermalStabilityClosed))

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse
