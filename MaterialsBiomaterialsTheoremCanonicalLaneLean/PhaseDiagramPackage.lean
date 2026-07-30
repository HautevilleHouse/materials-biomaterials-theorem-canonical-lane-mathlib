import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure PhaseDiagramPackage (C : CrystalStructurePackage) where
  temperatureRange : ℝ × ℝ
  pressureRange : ℝ × ℝ
  phaseBoundaries : Set (ℝ × ℝ)
  criticalPoints : Set (ℝ × ℝ)
  gibbsFreeEnergy : (ℝ × ℝ) → ℝ
  phaseBoundariesWellDefined : Prop
  criticalPointsClassified : Prop

structure PhaseDiagramEvidence (C : CrystalStructurePackage) (P : PhaseDiagramPackage C) where
  phaseBoundariesWellDefinedClosed : P.phaseBoundariesWellDefined
  criticalPointsClassifiedClosed : P.criticalPointsClassified

def PhaseDiagramClosed (C : CrystalStructurePackage) (P : PhaseDiagramPackage C) : Prop :=
  P.phaseBoundariesWellDefined ∧ P.criticalPointsClassified

theorem phase_diagram_closed_from_evidence
    (C : CrystalStructurePackage) (P : PhaseDiagramPackage C) (E : PhaseDiagramEvidence C P) :
    PhaseDiagramClosed C P := by
  exact And.intro E.phaseBoundariesWellDefinedClosed E.criticalPointsClassifiedClosed

end HautevilleHouse
end MaterialsBiomaterialsTheoremCanonicalLaneLean