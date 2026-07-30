import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure BiomaterialInterfacePackage where
  substrateSurface : Type u
  coatingLayer : Type v
  adhesionEnergy : Float
  biocompatibilityScore : Float
  interfaceFormation : Prop
  adhesionMeasured : Prop
  biocompatibilityAssessed : Prop
  interfaceFormationClosed : interfaceFormation
  adhesionMeasuredClosed : adhesionMeasured
  biocompatibilityAssessedClosed : biocompatibilityAssessed

structure BiomaterialInterfaceEvidence (B : BiomaterialInterfacePackage) where
  adhesionEnergyPositive : B.adhesionEnergy > 0
  biocompatibilityInRange : 0 ≤ B.biocompatibilityScore ∧ B.biocompatibilityScore ≤ 1

def BiomaterialInterfaceClosed (B : BiomaterialInterfacePackage) : Prop :=
  B.interfaceFormation ∧ B.adhesionMeasured ∧ B.biocompatibilityAssessed ∧
  B.adhesionEnergy > 0 ∧ (0 ≤ B.biocompatibilityScore ∧ B.biocompatibilityScore ≤ 1)

theorem biomaterial_interface_closed_from_evidence
    (B : BiomaterialInterfacePackage) (Ev : BiomaterialInterfaceEvidence B) :
    BiomaterialInterfaceClosed B := by
  exact And.intro B.interfaceFormationClosed (And.intro B.adhesionMeasuredClosed
    (And.intro B.biocompatibilityAssessedClosed (And.intro Ev.adhesionEnergyPositive Ev.biocompatibilityInRange)))

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse