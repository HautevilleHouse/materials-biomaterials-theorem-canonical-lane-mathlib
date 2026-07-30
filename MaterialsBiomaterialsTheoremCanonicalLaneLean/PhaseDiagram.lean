import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure PhaseDiagramPackage where
  temperature : Type u
  pressure : Type v
  composition : Type w
  phaseBoundaries : Prop
  triplePoints : Prop
  criticalPoints : Prop
  equilibriumPhases : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phaseBoundariesClosed : P.phaseBoundaries
  triplePointsClosed : P.triplePoints
  criticalPointsClosed : P.criticalPoints
  equilibriumPhasesClosed : P.equilibriumPhases

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phaseBoundaries ∧ P.triplePoints ∧ P.criticalPoints ∧ P.equilibriumPhases

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
  PhaseDiagramClosed P := by
  exact And.intro E.phaseBoundariesClosed (And.intro E.triplePointsClosed (And.intro E.criticalPointsClosed E.equilibriumPhasesClosed))

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse
